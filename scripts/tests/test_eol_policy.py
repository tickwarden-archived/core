import importlib.util,json,pathlib,tempfile,unittest
ROOT=pathlib.Path(__file__).resolve().parents[2];spec=importlib.util.spec_from_file_location('eol',ROOT/'archived/eol-kit/eol.py');m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
class EOL(unittest.TestCase):
 def setUp(self):
  self.tmp=tempfile.TemporaryDirectory();self.addCleanup(self.tmp.cleanup);self.root=pathlib.Path(self.tmp.name);self.src=self.root/'source';self.src.mkdir();(self.src/'pack.mcmeta').write_text(json.dumps({'pack':{'pack_format':6,'description':'test'}}));self.f=self.src/'data/test/functions';self.f.mkdir(parents=True);(self.f/'work.mcfunction').write_text('# original\nscoreboard players add @s foo 1\n');self.out=self.root/'out'
 def generate(self):return m.generate(self.src,self.out,'test/v1',True)
 def test_phase_boundaries(self):
  for tick,expected in [(0,1),(m.READ_ONLY_TICKS-1,1),(m.READ_ONLY_TICKS,2),(m.LOCK_TICKS-1,2),(m.LOCK_TICKS,3)]:self.assertEqual(m.phase(tick),expected)
 def test_negative_time_rejected(self):
  with self.assertRaises(ValueError):m.phase(-1)
 def test_requires_acknowledgement(self):
  with self.assertRaises(ValueError):m.generate(self.src,self.out,'test/v1')
 def test_source_unmodified(self):
  before=(self.f/'work.mcfunction').read_bytes();self.generate();self.assertEqual((self.f/'work.mcfunction').read_bytes(),before)
 def test_mutating_command_guarded_without_modern_return(self):
  r=self.generate();text=(self.out/'data/test/functions/work.mcfunction').read_text();self.assertIn('{phase:1} run scoreboard players add',text);self.assertNotIn('return ',text);self.assertLessEqual(len(r['objective']),16)
 def test_pure_read_function_works_until_final_lock(self):
  (self.f/'query.mcfunction').write_text('data get storage test:state\n');r=self.generate();self.assertIn('data/test/functions/query.mcfunction',r['readonly_functions']);self.assertIn('{phase:2} run data get',(self.out/'data/test/functions/query.mcfunction').read_text())
 def test_macro_marker_remains_first(self):
  (self.src/'pack.mcmeta').write_text(json.dumps({'pack':{'pack_format':18}}));(self.f/'macro.mcfunction').write_text('$say $(text)\n');self.generate();text=(self.out/'data/test/functions/macro.mcfunction').read_text();self.assertIn('run return 0\n$say $(text)',text)
 def test_load_tick_tags_prepend_lifecycle(self):
  p=self.src/'data/minecraft/tags/functions';p.mkdir(parents=True);(p/'load.json').write_text('{"replace":false,"values":["test:work"]}');r=self.generate();d=json.loads((self.out/'data/minecraft/tags/functions/load.json').read_text());self.assertEqual(d['values'],[r['namespace']+':load','test:work']);self.assertFalse(d['replace'])
 def test_reload_does_not_reset_elapsed_ticks(self):
  r=self.generate();text=(self.out/'data'/r['namespace']/'functions/load.mcfunction').read_text();self.assertIn('players add #ticks',text);self.assertNotIn('players set #ticks',text)
 def test_clock_stops_incrementing_at_lock(self):
  r=self.generate();text=(self.out/'data'/r['namespace']/'functions/tick.mcfunction').read_text();self.assertIn('matches 1..2 run scoreboard players add #ticks',text)
 def test_cleanup_never_erases_persistent_data(self):
  r=self.generate();text=(self.out/'data'/r['namespace']/'functions/cleanup.mcfunction').read_text();self.assertFalse(r['persistent_data_deleted']);self.assertFalse(r['deep_cleanup_enabled']);self.assertFalse(r['automatic_schedule_clear']);self.assertNotIn('schedule clear ',text)
  for cmd in ['data remove','scoreboard objectives remove','kill @','clear @','fill ']:self.assertNotIn(cmd,text)
 def test_schedule_cleanup_limited_to_internal_literal_targets(self):
  (self.f/'work.mcfunction').write_text('schedule function test:work 1t\nschedule function outside:other 1t\n');r=self.generate();self.assertEqual(r['literal_internal_scheduled_targets_for_manual_ownership_review'],['test:work'])
 def test_existing_output_refused(self):
  self.out.mkdir()
  with self.assertRaises(ValueError):self.generate()
 def test_resourcepack_not_falsely_given_runtime_lock(self):
  (self.f/'work.mcfunction').unlink()
  with self.assertRaises(ValueError):self.generate()
 def test_new_singular_function_layout(self):
  (self.src/'data/test/functions').rename(self.src/'data/test/function');r=self.generate();self.assertTrue((self.out/'data'/r['namespace']/'function/status.mcfunction').exists())
 def test_mixed_version_layout_has_lifecycle_for_both(self):
  f=self.src/'data/test/function';f.mkdir();(f/'a.mcfunction').write_text('say a')
  r=self.generate();self.assertTrue((self.out/'data'/r['namespace']/'function/load.mcfunction').exists());self.assertTrue((self.out/'data'/r['namespace']/'functions/load.mcfunction').exists())
 def test_version_identity_changes_lock_namespace(self):
  a=self.generate();b=m.generate(self.src,self.root/'other','test/v2',True);self.assertNotEqual(a['namespace'],b['namespace'])
 def test_pack_metadata_version_preserved(self):
  original=(self.src/'pack.mcmeta').read_bytes();self.generate();self.assertEqual((self.out/'pack.mcmeta').read_bytes(),original)
 def test_deep_cleanup_and_runtime_validation_not_claimed(self):
  r=self.generate();self.assertFalse(r['runtime_validated']);self.assertIn('not-wall-clock',r['clock'])
 def test_unsafe_identity_refused(self):
  with self.assertRaises(ValueError):m.generate(self.src,self.out,'test;kill',True)
 def test_line_continuations_rejected_transactionally(self):
  (self.f/'work.mcfunction').write_text('say one '+chr(92)+'\n two\n',encoding='utf-8')
  with self.assertRaisesRegex(ValueError,'continuation'):self.generate()
  self.assertFalse(self.out.exists())
 def test_invalid_pack_metadata(self):
  (self.src/'pack.mcmeta').write_text('{}',encoding='utf-8')
  with self.assertRaisesRegex(ValueError,'metadata'):self.generate()
  self.assertFalse(self.out.exists())
 def test_unsupported_function_location(self):
  (self.src/'data/test/stray.mcfunction').write_text('say hi',encoding='utf-8')
  with self.assertRaisesRegex(ValueError,'outside'):self.generate()
 def test_schedule_end_of_file_and_dynamic(self):
  (self.src/'pack.mcmeta').write_text(json.dumps({'pack':{'pack_format':18}}));(self.f/'work.mcfunction').write_text('$schedule function test:$(name) 1t\nschedule function test:work 1t',encoding='utf-8')
  r=self.generate();self.assertEqual(r['literal_internal_scheduled_targets_for_manual_ownership_review'],['test:work']);self.assertTrue(r['dynamic_schedules_detected']);self.assertFalse(r['schedule_detection_complete'])
 def test_reload_notifies_only_on_phase_change(self):
  r=self.generate();text=(self.out/'data'/r['namespace']/'functions/load.mcfunction').read_text(encoding='utf-8');self.assertIn('execute unless score #last',text);self.assertIn('unless data storage',text)
 def test_unicode_line_separator_preserved(self):
  (self.f/'work.mcfunction').write_text('say a\u2028b\n',encoding='utf-8');self.generate();self.assertIn('say a\u2028b',(self.out/'data/test/functions/work.mcfunction').read_text(encoding='utf-8'))
 def test_validation_failure_removes_partial_output(self):
  p=self.src/'data/minecraft/tags/functions';p.mkdir(parents=True);(p/'load.json').write_text('{invalid',encoding='utf-8')
  with self.assertRaises(ValueError):self.generate()
  self.assertFalse(self.out.exists());self.assertFalse(list(self.root.glob('.eol-stage-*')))
 def test_nested_output_refused_without_modifying_source(self):
  with self.assertRaises(ValueError):m.generate(self.src,self.src/'nested'/'out','test/v1',True)
  self.assertFalse((self.src/'nested').exists())
 def test_source_change_rejects_and_removes_stage(self):
  from unittest.mock import patch
  actual=m.manifest
  def modified(source):
   (source/'added').write_text('changed',encoding='utf-8');return actual(source)
  with patch.object(m,'manifest',side_effect=modified):
   with self.assertRaisesRegex(ValueError,'changed'):self.generate()
  self.assertFalse(self.out.exists());self.assertFalse(list(self.root.glob('.eol-stage-*')))
 def test_modern_entry_guard_preserves_continuations(self):
  (self.src/'pack.mcmeta').write_text(json.dumps({'pack':{'pack_format':18}}));body='say one '+chr(92)+'\n two\n';(self.f/'work.mcfunction').write_text(body,encoding='utf-8');r=self.generate();text=(self.out/'data/test/functions/work.mcfunction').read_text(encoding='utf-8');self.assertIn('run return 0\n'+body,text);self.assertEqual(r['entry_guard_mode'],'early-return')
 def test_missing_phase_fails_closed(self):
  (self.src/'pack.mcmeta').write_text(json.dumps({'pack':{'pack_format':18}}));self.generate();text=(self.out/'data/test/functions/work.mcfunction').read_text(encoding='utf-8');self.assertIn('execute unless data storage',text);self.assertIn('{phase:1} run return 0',text)
 def test_test_fixture_not_treated_as_function(self):
  f=self.src/'data/test/test';f.mkdir();(f/'fixture.mcfunction').write_text('say fixture');r=self.generate();self.assertNotIn('data/test/test/fixture.mcfunction',r['guarded_functions'])
if __name__=='__main__':unittest.main()
