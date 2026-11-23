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
                files = {p.relative_to(target).as_posix() for p in target.rglob('*') if p.is_file()}
                self.assertEqual(files, members, record['path'])
                for name in members:
                    self.assertEqual(hashlib.sha256((target / name).read_bytes()).digest(), hashlib.sha256(z.read(name)).digest(), f"{record['path']}/{name}")
                policy = json.loads(z.read('vortaforge-eol.json'))
                self.assertEqual(len(policy['guarded_functions']), record['function_count'])
                self.assertFalse(policy['runtime_validated'])
                self.assertFalse(policy['automatic_schedule_clear'])

if __name__ == '__main__':
    unittest.main()
