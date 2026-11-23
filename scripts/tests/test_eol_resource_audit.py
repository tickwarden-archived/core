"""Check offline candidate JSON inventory; this is not a game-runtime test."""
import importlib.util,json,unittest,zipfile,tempfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];P=ROOT/'archived/eol-kit/analyze_candidates.py';spec=importlib.util.spec_from_file_location('audit',P);audit=importlib.util.module_from_spec(spec);spec.loader.exec_module(audit)
class ResourceAudit(unittest.TestCase):
 def test_nested_run_command_and_rewards(self):
  with tempfile.TemporaryDirectory() as tmp:
   p=Path(tmp)/'candidate.zip'
   with zipfile.ZipFile(p,'w') as z:
    z.writestr('vortaforge-eol.json',json.dumps({'pack_id':'example'}));z.writestr('data/example/advancement/a.json',json.dumps({'rewards':{'function':'example:test'}}));z.writestr('data/example/dialog/a.json',json.dumps({'click_event':{'action':'run_command','value':'say hi'}}));z.writestr('data/example/function/a.mcfunction','tellraw @s {"clickEvent":{"action":"run_command","value":"say hi"}}\n')
   r=audit.analyze(p);self.assertEqual(r['json_resource_counts'],{'advancements':1,'dialogs':1});self.assertEqual(r['advancements_with_function_rewards'],['data/example/advancement/a.json']);self.assertEqual(r['json_files_with_run_command_actions'],['data/example/dialog/a.json']);self.assertEqual(r['functions_with_run_command_token'],['data/example/function/a.mcfunction'])
 def test_checked_in_report_matches_candidate_bytes(self):
  folder=ROOT/'archived/eol-candidates';old=json.loads((folder/'resource-audit.json').read_text(encoding='utf-8'))['candidates'];self.assertEqual(len(old),27)
  for r in old:
   with self.subTest(candidate=r['pack_id']):self.assertEqual(audit.analyze(folder/r['archive']),r)
if __name__=='__main__':unittest.main()
