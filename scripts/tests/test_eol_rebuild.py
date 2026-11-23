"""Offline rebuild manifest and transactional checks."""
import hashlib,importlib.util,json,pathlib,tempfile,unittest,zipfile
ROOT=pathlib.Path(__file__).resolve().parents[2];spec=importlib.util.spec_from_file_location('rebuilder',ROOT/'archived/eol-kit/rebuild_candidates.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
class Rebuild(unittest.TestCase):
 def setUp(self):
  self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.root=pathlib.Path(self.tmp.name);self.src=self.root/'sources/core/pack';self.src.mkdir(parents=True);(self.src/'pack.mcmeta').write_text('{"pack":{"pack_format":18,"description":"test"}}',encoding='utf-8');f=self.src/'data/test/functions';f.mkdir(parents=True);(f/'a.mcfunction').write_text('say hello\n',encoding='utf-8');self.existing=self.root/'existing';self.existing.mkdir();temp=self.root/'generated';m.eol.generate(self.src,temp,'core-test',True)
  archive=self.existing/'core-test.zip'
  with zipfile.ZipFile(archive,'w') as z:
   for p in temp.rglob('*'):
    if p.is_file():z.write(p,p.relative_to(temp).as_posix())
  record={'id':'core-test','repository':'core','source_commit':'sample','source_path':'pack','archive':'core-test.zip','sha256':hashlib.sha256(archive.read_bytes()).hexdigest(),'function_count':1,'guard_mode':'early-return','runtime_validated':False};(self.existing/'manifest.json').write_text(json.dumps({'schema':1,'release':'experimental-do-not-deploy','generated_candidates':[record]}),encoding='utf-8');self.out=self.root/'result'
 def test_builds_from_matching_source(self):
  self.assertEqual(m.rebuild(self.root/'sources',self.existing,self.out),1);manifest=json.loads((self.out/'manifest.json').read_text(encoding='utf-8'));self.assertFalse(manifest['generated_candidates'][0]['runtime_validated'])
 def test_changed_source_does_not_publish(self):
  (self.src/'added').write_text('not original',encoding='utf-8')
  with self.assertRaisesRegex(ValueError,'does not match'):m.rebuild(self.root/'sources',self.existing,self.out)
  self.assertFalse(self.out.exists());self.assertFalse(list(self.root.glob('.eol-rebuild-*')))
 def test_output_inside_source_root_rejected(self):
  p=self.root/'sources/core/result'
  with self.assertRaisesRegex(ValueError,'inside source'):m.rebuild(self.root/'sources',self.existing,p)
  self.assertFalse(p.exists())
 def test_existing_output_rejected(self):
  self.out.mkdir()
  with self.assertRaisesRegex(ValueError,'exists'):m.rebuild(self.root/'sources',self.existing,self.out)
if __name__=='__main__':unittest.main()
