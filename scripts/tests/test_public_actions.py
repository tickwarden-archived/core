"""Offline tests for public composite action helpers, independent of GitHub."""
import hashlib
import importlib.util
import os
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
SCRIPT = ROOT / 'actions/verify-sha256/verify.py'
spec = importlib.util.spec_from_file_location('verify_public_sha256', SCRIPT)
verify = importlib.util.module_from_spec(spec)
spec.loader.exec_module(verify)

class VerifyManifest(unittest.TestCase):
    def setUp(self):
        self.tmp = tempfile.TemporaryDirectory()
        self.addCleanup(self.tmp.cleanup)
        self.root = Path(self.tmp.name)
        (self.root / 'nested').mkdir()
        (self.root / 'nested/a file.jar').write_bytes(b'example')
        self.digest = hashlib.sha256(b'example').hexdigest()
        self.manifest = self.root / 'SHA256SUMS'
        self.manifest.write_text(self.digest + '  nested/a file.jar\n', encoding='utf-8')

    def test_valid_and_strict_extra_check(self):
        self.assertEqual(verify.verify(self.root, 'SHA256SUMS', reject_extra=True), (1, 7))
        (self.root / 'extra').write_text('x')
        with self.assertRaisesRegex(ValueError, 'Unexpected'):
            verify.verify(self.root, 'SHA256SUMS', reject_extra=True)
        self.assertEqual(verify.verify(self.root, 'SHA256SUMS'), (1, 7))

    def test_changed_missing_empty_and_bad_format_fail(self):
        file = self.root / 'nested/a file.jar'
        file.write_bytes(b'changed')
        with self.assertRaisesRegex(ValueError, 'mismatch'):
            verify.verify(self.root, 'SHA256SUMS')
        file.unlink()
        with self.assertRaisesRegex(ValueError, 'Missing'):
            verify.verify(self.root, 'SHA256SUMS')
        file.write_bytes(b'')
        self.manifest.write_text(hashlib.sha256(b'').hexdigest() + '  nested/a file.jar\n')
        with self.assertRaisesRegex(ValueError, 'Empty'):
            verify.verify(self.root, 'SHA256SUMS')
        self.assertEqual(verify.verify(self.root, 'SHA256SUMS', allow_empty=True), (1, 0))
        self.manifest.write_text('invalid\n')
        with self.assertRaisesRegex(ValueError, 'Invalid'):
            verify.verify(self.root, 'SHA256SUMS')

    def test_duplicates_path_traversal_and_symlinks_fail(self):
        line = self.digest + '  nested/a file.jar\n'
        for content in (line + line, self.digest + '  ../outside\n', self.digest + '  /etc/passwd\n', self.digest + '  ./nested/a file.jar\n'):
            self.manifest.write_text(content)
            with self.subTest(content=content), self.assertRaises(ValueError):
                verify.verify(self.root, 'SHA256SUMS')
        self.manifest.write_text(self.digest + '  link\n')
        (self.root / 'link').symlink_to(self.root / 'nested/a file.jar')
        with self.assertRaisesRegex(ValueError, 'Symlinks'):
            verify.verify(self.root, 'SHA256SUMS')

    def test_action_outputs_and_summary(self):
        output, summary = self.root / 'out', self.root / 'summary'
        env = dict(os.environ, CHECK_DIRECTORY=str(self.root), CHECK_SUMMARY='true', GITHUB_OUTPUT=str(output), GITHUB_STEP_SUMMARY=str(summary))
        result = subprocess.run([sys.executable, str(SCRIPT)], env=env, capture_output=True, text=True)
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(output.read_text(), 'files=1\nbytes=7\n')
        self.assertIn('Verified 1 file(s), 7 bytes', summary.read_text())

    def test_invalid_boolean_fails(self):
        env = dict(os.environ, CHECK_DIRECTORY=str(self.root), CHECK_REJECT_EXTRA='yes')
        result = subprocess.run([sys.executable, str(SCRIPT)], env=env, capture_output=True, text=True)
        self.assertNotEqual(result.returncode, 0)
        self.assertIn('must be true or false', result.stderr)

class ActionWiring(unittest.TestCase):
    def test_root_dispatcher_and_standalone_actions_are_present(self):
        root = (ROOT / 'action.yml').read_text(encoding='utf-8')
        self.assertIn('using: composite', root)
        for name, helper in [('download','download.py'), ('execute','execute.py'), ('vf_script','vf_script.py'), ('verify-sha256','verify.py')]:
            self.assertTrue((ROOT / 'actions' / name / 'action.yml').is_file(), name)
            self.assertIn(f'$GITHUB_ACTION_PATH/actions/{name}/{helper}', root)
        for name in ('setup-toolchain', 'verify-sha256', 'download', 'execute', 'vf_script'):
            self.assertIn(name, root)
        toolchain = (ROOT / 'actions/setup-toolchain/action.yml').read_text(encoding='utf-8')
        for pin in ('b843ebf9b913146b38da2eaa7aeddf76074ae1ad', '6d4fd22b20465ccc0f7354476588e8df7c9ca0e0', '949feb2413d6458794dcd2491c4babbbce0c15c1', '3f5f9adaf7d9fecd50b5935e54106014257a94e6'):
            self.assertIn(pin, root)
            self.assertIn(pin, toolchain)

    def test_reuses_local_actions_after_checkout(self):
        for name in ('quality.yml', 'backup-org.yml', 'macroengine-modules.yml'):
            text = (ROOT / '.github/workflows' / name).read_text(encoding='utf-8')
            self.assertIn('uses: ./actions/setup-toolchain', text, name)
            self.assertLess(text.index('actions/checkout@'), text.index('uses: ./actions/setup-toolchain'), name)
        quality = (ROOT / '.github/workflows/quality.yml').read_text(encoding='utf-8')
        self.assertIn('uses: ./actions/verify-sha256', quality)
        self.assertIn('reject-extra: "true"', quality)

if __name__ == '__main__':
    unittest.main()
