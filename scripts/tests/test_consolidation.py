"""Offline provenance, archive and workflow checks for the consolidation."""
import hashlib,json,pathlib,subprocess,unittest
ROOT=pathlib.Path(__file__).resolve().parents[2]
def digest(path):return hashlib.sha256(path.read_bytes()).hexdigest()
class Consolidation(unittest.TestCase):
 @classmethod
 def setUpClass(cls):cls.manifest=json.loads((ROOT/'docs/CONSOLIDATION-SOURCES.json').read_text(encoding='utf-8'))
 def test_each_transferred_file_has_the_expected_bytes(self):
  files=self.manifest['files'];self.assertEqual(len(files),3586)
  destinations=set()
  for f in files:
   path=ROOT/f['destination'];self.assertNotIn(f['destination'],destinations);destinations.add(f['destination']);self.assertTrue(path.is_file(),f['destination']);self.assertEqual(digest(path),f.get('migrated_sha256',f['sha256']),f['destination'])
 def test_vortex_github_files_are_inert_and_mapped(self):
  for f in self.manifest['files']:
   if f['repository']=='vortex' and f['source'].startswith('.github/'):
    self.assertTrue(f['destination'].startswith('archived/tools/vortex-source/ci-source/'))
  self.assertFalse((ROOT/'archived/tools/vortex-source/.github').exists())
 def test_recovery_bundles_match_and_have_original_refs(self):
  for base,name in [('archived/tools/vortex-source/recovery','vortex'),('components/macroengine-modules/recovery','macroengine-modules')]:
   d=ROOT/base;info=json.loads((d/'refs.json').read_text());bundle=d/(name+'.bundle');self.assertEqual(digest(bundle),info['bundle_sha256']);out=subprocess.check_output(['git','bundle','list-heads',str(bundle)],text=True);refs=dict(line.split(' ',1)[::-1] for line in out.splitlines() if line.split(' ',1)[1] != 'HEAD');self.assertEqual(refs,info['refs'])
 def test_release_assets_match_public_release_digest(self):
  base=ROOT/'archived/tools/vortex-source/release-assets';manifest=json.loads((base/'manifest.json').read_text());self.assertEqual(len(manifest),2)
  for a in manifest:
   p=base/(str(a['id'])+'-'+a['name']);self.assertEqual(p.stat().st_size,a['size']);self.assertEqual(digest(p),a['sha256']);self.assertTrue(a['digest_verified'])
 def test_components_are_separate_and_no_server_job_is_added(self):
  settings=(ROOT/'settings.gradle').read_text(encoding='utf-8');self.assertNotIn("'components'",settings);workflow=(ROOT/'.github/workflows/macroengine-modules.yml').read_text(encoding='utf-8');self.assertIn('tools/test_module_removal.py',workflow);self.assertIn('check dist',workflow);self.assertNotIn('server.jar',workflow);self.assertNotIn('eula=true',workflow);self.assertNotIn('vortaforge/macroengine-modules',workflow)
if __name__=='__main__':unittest.main()
