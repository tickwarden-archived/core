#!/usr/bin/env python3
"""Offline opt-in EOL distribution generator. Never modifies source or a running world."""
import argparse,hashlib,json,re,shutil,tempfile,os
from pathlib import Path
TPS=20
READ_ONLY_TICKS=3*86400*TPS
LOCK_TICKS=7*86400*TPS

def phase(ticks):
    if ticks<0:raise ValueError('Negative tick count')
    return 3 if ticks>=LOCK_TICKS else (2 if ticks>=READ_ONLY_TICKS else 1)

def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()

def pure(lines):
    commands=[x.strip() for x in lines if x.strip() and not x.strip().startswith('#')]
    return bool(commands) and all(re.match(r'^(?:data get |scoreboard players (?:get|list)(?: |$)|scoreboard objectives list$|list$)',x) for x in commands)

def manifest(source):
    result={}
    for f in sorted(source.rglob('*')):
        if f.is_symlink(): raise ValueError('Source symlinks rejected')
        if f.is_file(): result[f.relative_to(source).as_posix()]=sha(f)
    return result

def generate(source,output,pack_id,acknowledge=False):
    source=Path(source).absolute();output=Path(output).absolute()
    if any(p.is_symlink() for p in [source,output,*output.parents]):raise ValueError('Symlink path rejected')
    if output.resolve().is_relative_to(source.resolve()):raise ValueError('Output must be outside source')
    if output.exists() or output.is_symlink(): raise ValueError('Output must not exist')
    output.parent.mkdir(parents=True,exist_ok=True)
    with tempfile.TemporaryDirectory(prefix='.eol-stage-',dir=output.parent) as tmp:
        staged=Path(tmp)/'result'
        result=_generate(source,staged,pack_id,acknowledge)
        if output.exists() or output.is_symlink(): raise ValueError('Output appeared during generation')
        os.rename(staged,output)
        return result

def _generate(source,output,pack_id,acknowledge=False):
    source=Path(source).absolute();output=Path(output).absolute()
    if not acknowledge:raise ValueError('Explicit acknowledgement required: generated packs change runtime behavior')
    if not re.fullmatch(r'[a-z0-9][a-z0-9._/@-]{0,160}',pack_id):raise ValueError('Unsafe pack/version id')
    if any(p.is_symlink() for p in [source,output,*output.parents]):raise ValueError('Symlink path rejected')
    source=source.resolve()
    if output.exists() or output.resolve().is_relative_to(source):raise ValueError('Output must be a new directory outside source')
    if not (source/'pack.mcmeta').is_file():raise ValueError('No pack metadata')
    meta=json.loads((source/'pack.mcmeta').read_text(encoding='utf-8'));functions=[];before={}
    if not isinstance(meta,dict) or not isinstance(meta.get('pack'),dict):raise ValueError('Invalid pack metadata: pack must be an object')
    for f in sorted(source.rglob('*')):
        if f.is_symlink():raise ValueError('Source symlinks rejected')
        if f.is_file():
            before[f.relative_to(source).as_posix()]=sha(f)
            if f.suffix=='.mcfunction' and f.relative_to(source).parts[0]=='data':functions.append(f)
    if not functions:raise ValueError('Not a standalone functional datapack; resourcepacks need archival policy only')
    if any(len(f.relative_to(source).parts)<4 for f in functions):raise ValueError('Unsupported function outside namespace function directory')
    styles={f.relative_to(source).parts[2] for f in functions}
    if len(styles)!=1 or not styles.issubset({'function','functions'}):raise ValueError('Ambiguous version/function layout requires review')
    style=next(iter(styles));suffix=hashlib.sha256(pack_id.encode()).hexdigest()[:10];ns='vf_eol_'+suffix;obj='vfE'+suffix
    if (source/'data'/ns).exists() or any(obj in f.read_text(encoding='utf-8') for f in functions):raise ValueError('Lifecycle identifier collision')
    target_data=output/'data'/ns/style
    originals={f.relative_to(source).as_posix():f.read_text(encoding='utf-8') for f in functions}
    ids={':'.join([f.relative_to(source).parts[1],'/'.join(f.relative_to(source).parts[3:])[:-11]]) for f in functions}
    # Refuse continuation syntax until version-specific parsing is validated.
    if any(re.search(r'\\[ \t]*\r?$',line) for text in originals.values() for line in text.split('\n')):
        raise ValueError('Backslash line continuation requires version-aware review; output not generated')
    scheduled=set();dynamic_schedule=False
    for text in originals.values():
        if re.search(r'\bschedule function [^\s]*\$\(',text):dynamic_schedule=True
        for name in re.findall(r'\bschedule function ([a-z0-9_.-]+:[a-z0-9_./-]+)(?=\s|$)',text):
            if name in ids:scheduled.add(name)
    shutil.copytree(source,output);target_data.mkdir(parents=True)
    guarded=[];readonly=[]
    for rel,text in originals.items():
        lines=text.split('\n');is_pure=pure(lines);threshold='3..' if is_pure else '2..';rendered=['# Generated EOL guard; source bytes preserved in recovery archive.']
        for line in lines:
            t=line.strip()
            if not t or t.startswith('#'):rendered.append(line);continue
            macro=t.startswith('$');body=t[1:] if macro else t
            rendered.append(('$' if macro else '')+f'execute unless score #phase {obj} matches {threshold} run '+body)
        (output/rel).write_text('\n'.join(rendered)+'\n',encoding='utf-8');guarded.append(rel)
        if is_pure:readonly.append(rel)
    def write(name,lines):(target_data/(name+'.mcfunction')).write_text('\n'.join(lines)+'\n',encoding='utf-8')
    def warn(text):return 'tellraw @a '+json.dumps({'text':'[VortaForge EOL] '+text,'color':'gold'},ensure_ascii=False)
    write('refresh',[f'scoreboard players set #phase {obj} 1',f'execute if score #ticks {obj} matches {READ_ONLY_TICKS}.. run scoreboard players set #phase {obj} 2',f'execute if score #ticks {obj} matches {LOCK_TICKS}.. run scoreboard players set #phase {obj} 3'])
    notices=[f'execute if score #phase {obj} matches 1 run '+warn(pack_id+': warning phase; read-only after 72 online hours, locked after 168 online hours at 20 TPS.'),f'execute if score #phase {obj} matches 2 run '+warn(pack_id+': restricted functions phase; non-function data and external commands are not blocked. Persistent world data is NOT erased.'),f'execute if score #phase {obj} matches 3 run '+warn(pack_id+': EOL locked. Use function '+ns+':status for lifecycle state.'),f'scoreboard players operation #last {obj} = #phase {obj}']
    write('notice',notices)
    write('load',[f'execute unless data storage {ns}:lifecycle initialized run scoreboard objectives add {obj} dummy',f'data modify storage {ns}:lifecycle initialized set value 1b',*[f'scoreboard players add {n} {obj} 0' for n in ['#ticks','#phase','#last','#cleaned']],f'function {ns}:refresh',f'execute unless score #last {obj} = #phase {obj} run function {ns}:notice'])
    write('cleanup',[ '# Exact statically-owned scheduled callbacks only; no world/player/storage/objective/entity deletion.',*[f'schedule clear {name}' for name in sorted(scheduled)],f'scoreboard players set #cleaned {obj} 1'])
    write('tick',[f'execute if score #phase {obj} matches 1..2 run scoreboard players add #ticks {obj} 1',f'function {ns}:refresh',f'execute unless score #last {obj} = #phase {obj} run function {ns}:notice',f'execute if score #phase {obj} matches 3 if score #cleaned {obj} matches 0 run function {ns}:cleanup'])
    write('status',[f'scoreboard players get #phase {obj}',f'scoreboard players get #ticks {obj}',f'scoreboard players get #cleaned {obj}'])
    for tag in ['load','tick']:
        p=output/'data/minecraft/tags'/style/(tag+'.json');p.parent.mkdir(parents=True,exist_ok=True)
        data=json.loads(p.read_text(encoding='utf-8')) if p.exists() else {'values':[]}
        if not isinstance(data.get('values'),list):raise ValueError('Invalid entry-point tag')
        data['values'].insert(0,ns+':'+tag);p.write_text(json.dumps(data,indent=2)+'\n',encoding='utf-8')
    policy={'schema':1,'pack_id':pack_id,'source_format':meta['pack'],'namespace':ns,'objective':obj,'clock':'online-ticks-not-wall-clock','expected_tps':TPS,'read_only_at_ticks':READ_ONLY_TICKS,'locked_at_ticks':LOCK_TICKS,'guarded_functions':guarded,'readonly_functions':readonly,'literal_internal_scheduled_targets_to_clear_best_effort':sorted(scheduled),'dynamic_schedules_detected':dynamic_schedule,'schedule_detection_complete':False,'persistent_data_deleted':False,'deep_cleanup_enabled':False,'runtime_validated':False,'status_function':ns+':status','control_plane_exception':'Lifecycle scores, storage and notices change. Other datapack resources, operators and external commands are not blocked; scoreboard reset bypasses the mechanism. A function with any non-allowlisted command is wholly blocked in phase 2.','source_manifest':before}
    (output/'vortaforge-eol.json').write_text(json.dumps(policy,indent=2)+'\n',encoding='utf-8')
    if manifest(source)!=before:raise ValueError('Source changed during generation; no output published')
    return policy

def main():
    p=argparse.ArgumentParser();p.add_argument('--source',required=True);p.add_argument('--output',required=True);p.add_argument('--pack-id',required=True);p.add_argument('--acknowledge-runtime-change',action='store_true');a=p.parse_args()
    r=generate(a.source,a.output,a.pack_id,a.acknowledge_runtime_change);print(json.dumps({'pack_id':r['pack_id'],'guarded_functions':len(r['guarded_functions']),'runtime_validated':False}))
if __name__=='__main__':main()
