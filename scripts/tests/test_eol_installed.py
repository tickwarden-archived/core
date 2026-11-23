"""Verify the checked-in pack copies match the guarded candidates; no game runtime."""
import hashlib
import json
import unittest
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]

class InstalledEOL(unittest.TestCase):
    def test_installed_packs_are_exact_candidate_copies(self):
        manifest = json.loads((ROOT / 'archived/eol-kit/installed-packs.json').read_text(encoding='utf-8'))
        self.assertEqual(manifest['status'], 'experimental-not-runtime-validated')
        self.assertEqual(len(manifest['packs']), 18)
        paths = set()
        for record in manifest['packs']:
            target = ROOT / record['path']
            self.assertNotIn(record['path'], paths)
            paths.add(record['path'])
            archive = ROOT / 'archived/eol-candidates' / record['candidate']
            self.assertEqual(hashlib.sha256(archive.read_bytes()).hexdigest(), record['candidate_sha256'])
            with zipfile.ZipFile(archive) as z:
                self.assertIsNone(z.testzip())
                members = set(z.namelist())
                overrides = record.get('post_install_overrides', {})
                removed = set(record.get('post_install_removed', []))
                self.assertTrue(removed <= members)
                files = {p.relative_to(target).as_posix() for p in target.rglob('*') if p.is_file()}
                self.assertEqual(files, (members - removed) | set(overrides), record['path'])
                for name in (members - removed) | set(overrides):
                    expected = overrides[name] if name in overrides else hashlib.sha256(z.read(name)).hexdigest()
                    self.assertEqual(hashlib.sha256((target / name).read_bytes()).hexdigest(), expected, f"{record['path']}/{name}")
                policy = json.loads((target / 'vortaforge-eol.json').read_text(encoding='utf-8'))
                self.assertEqual(len(policy['guarded_functions']), record['function_count'])
                self.assertFalse(policy['runtime_validated'])
                self.assertFalse(policy['automatic_schedule_clear'])
                for name in policy.get('comment_only_functions', []):
                    body = (target / name).read_bytes()
                    self.assertEqual(hashlib.sha256(body).hexdigest(), policy['source_manifest'][name])
                    self.assertTrue(all(not line.strip() or line.lstrip().startswith(b'#') for line in body.splitlines()), name)
                for name in policy['guarded_functions']:
                    lines = (target / name).read_text(encoding='utf-8').splitlines()
                    self.assertTrue(lines[0].startswith('# EOL entry guard'), name)
                    if policy['entry_guard_mode'] == 'early-return':
                        self.assertIn('unless data storage ' + policy['namespace'] + ':lifecycle', lines[1], name)
                        self.assertTrue(lines[1].endswith(' run return 0'), name)
                    else:
                        for line in lines[1:]:
                            if line.strip() and not line.lstrip().startswith('#'):
                                self.assertTrue(line.startswith('execute if data storage ' + policy['namespace'] + ':lifecycle {phase:'), name)

if __name__ == '__main__':
    unittest.main()
