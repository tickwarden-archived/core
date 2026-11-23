"""Static guard and archive-integrity checks; not a Minecraft runtime test."""
import hashlib,json,unittest,zipfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]
class CandidateCoverage(unittest.TestCase):
 def test_every_candidate_has_guards_and_valid_hashes(self):
  folder=ROOT/'archived/eol-candidates';manifest=json.loads((folder/'manifest.json').read_text(encoding='utf-8'));records=manifest['generated_candidates'];self.assertEqual(len(records),27);self.assertTrue(all(not r.get('runtime_validated',False) and 'error' not in r for r in records))
  total=0
  for r in records:
   p=folder/r['archive'];self.assertEqual(hashlib.sha256(p.read_bytes()).hexdigest(),r['sha256'])
   with zipfile.ZipFile(p) as z:
    self.assertIsNone(z.testzip());policy=json.loads(z.read('vortaforge-eol.json'));self.assertEqual(len(policy['guarded_functions']),r['function_count']);self.assertFalse(policy['automatic_schedule_clear']);self.assertFalse(policy['runtime_validated']);self.assertEqual(len(set(policy['guarded_functions'])),r['function_count'])
    for f in policy['guarded_functions']:
     lines=z.read(f).decode('utf-8').split('\n');self.assertTrue(lines[0].startswith('# EOL entry guard'),f)
     if policy['entry_guard_mode']=='early-return':
      self.assertIn('run return 0',lines[1],f);self.assertIn('unless data storage ',lines[1],f);self.assertEqual(hashlib.sha256(z.read(f).split(b'\n',2)[2]).hexdigest(),policy['source_manifest'][f],f)
     else:
      for line in lines[1:]:
       if line.strip() and not line.strip().startswith('#'):self.assertTrue(line.startswith('execute if data storage '+policy['namespace']+':lifecycle {phase:'),f)
    total+=len(policy['guarded_functions'])
  self.assertEqual(total,8900)
if __name__=='__main__':unittest.main()
