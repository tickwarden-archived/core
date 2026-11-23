#!/usr/bin/env python3
"""Static JSON risk inventory only; never loads or contacts a Minecraft server."""
import argparse,collections,json,re,zipfile
from pathlib import Path

KINDS={'recipe':'recipes','recipes':'recipes','loot_table':'loot_tables','loot_tables':'loot_tables','advancement':'advancements','advancements':'advancements','predicate':'predicates','predicates':'predicates','dialog':'dialogs','dialogs':'dialogs','item_modifier':'item_modifiers','item_modifiers':'item_modifiers'}

def walk(value):
 if isinstance(value,dict):
  yield value
  for child in value.values():yield from walk(child)
 elif isinstance(value,list):
  for child in value:yield from walk(child)

def analyze(path):
 counts=collections.Counter();command_actions=[];advancement_rewards=[];invalid_json=[];function_command_actions=[];dynamic_macro_functions=[]
 with zipfile.ZipFile(path) as z:
  policy=json.loads(z.read('vortaforge-eol.json'))
  for info in z.infolist():
   name=info.filename;parts=name.split('/')
   if info.is_dir() or len(parts)<4 or parts[0]!='data':continue
   if parts[2] in ('function','functions') and name.endswith('.mcfunction'):
    content=z.read(info).decode('utf-8')
    if re.search(r'(?<![\w])run_command(?![\w])',content):function_command_actions.append(name)
    if '$(' in content:dynamic_macro_functions.append(name)
    continue
   if not name.endswith('.json'):continue
   kind=KINDS.get(parts[2]);
   if kind:counts[kind]+=1
   try:value=json.loads(z.read(info).decode('utf-8'))
   except (ValueError,UnicodeDecodeError):invalid_json.append(name);continue
   for obj in walk(value):
    action=obj.get('action');typ=obj.get('type')
    if action in ('run_command','minecraft:run_command') or typ in ('run_command','minecraft:run_command') or 'run_command' in obj:
     command_actions.append(name)
   if kind=='advancements' and isinstance(value,dict) and isinstance(value.get('rewards'),dict) and 'function' in value['rewards']:
    advancement_rewards.append(name)
 return {'archive':Path(path).name,'pack_id':policy['pack_id'],'json_resource_counts':dict(sorted(counts.items())),'json_files_with_run_command_actions':sorted(set(command_actions)),'advancements_with_function_rewards':sorted(set(advancement_rewards)),'functions_with_run_command_token':sorted(set(function_command_actions)),'functions_with_macro_placeholder_count':len(set(dynamic_macro_functions)),'invalid_json_files':sorted(invalid_json),'limitations':'Static heuristics only; command actions may use other formats, callbacks and resources can mutate state, and no runtime verification was performed.'}

def main():
 p=argparse.ArgumentParser();p.add_argument('folder',type=Path);p.add_argument('--output',type=Path,required=True);a=p.parse_args();manifest=json.loads((a.folder/'manifest.json').read_text(encoding='utf-8'));results=[analyze(a.folder/x['archive']) for x in manifest['generated_candidates'] if 'archive' in x];a.output.write_text(json.dumps({'schema':1,'analysis':'offline-static-resource-inventory','candidates':results},indent=2)+'\n',encoding='utf-8');print('Audited',len(results),'candidate ZIPs; no server contacted.')
if __name__=='__main__':main()
