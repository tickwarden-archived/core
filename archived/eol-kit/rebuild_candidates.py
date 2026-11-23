#!/usr/bin/env python3
"""Offline candidate ZIP rebuild from independently checked-out, hash-matching sources.

Example: python3 archived/eol-kit/rebuild_candidates.py --source-root /path/to/three-clones --output /tmp/eol-rebuilt
The source root must contain core, vortex and vorta-core directories. The existing
candidate manifests bind inputs by SHA-256; Git branch names are not trusted.
Never runs a Minecraft server or network client.
"""
import argparse,hashlib,importlib.util,json,os,re,tempfile,zipfile
from pathlib import Path
HERE=Path(__file__).resolve().parent;CORE=HERE.parent.parent
spec=importlib.util.spec_from_file_location('vf_eol',HERE/'eol.py');eol=importlib.util.module_from_spec(spec);spec.loader.exec_module(eol)

def rebuild(source_root, existing, output):
 source_root=Path(source_root).resolve();existing=Path(existing).resolve();output=Path(output).absolute()
 if output.exists() or output.is_symlink():raise ValueError('Output exists')
 if output.resolve().is_relative_to(source_root):raise ValueError('Output must not be inside source root')
 if any(p.is_symlink() for p in [output,*output.parents]):raise ValueError('Symlink output path rejected')
 manifest=json.loads((existing/'manifest.json').read_text(encoding='utf-8'));records=manifest['generated_candidates'];results=[];seen=set()
 output.parent.mkdir(parents=True,exist_ok=True)
 with tempfile.TemporaryDirectory(prefix='.eol-rebuild-',dir=output.parent) as temp:
  staging=Path(temp)/'result';staging.mkdir()
  for r in records:
   ident=r['id'];repo=r['repository'];name=r['archive']
   if not re.fullmatch(r'[a-z0-9][a-z0-9._-]*',ident) or ident in seen or repo not in ('core','vortex','vorta-core') or name!=ident+'.zip':raise ValueError('Invalid candidate manifest')
   seen.add(ident);src=(source_root/repo/r['source_path']).resolve();root=(source_root/repo).resolve()
   if not src.is_relative_to(root):raise ValueError('Source escapes repository')
   with zipfile.ZipFile(existing/name) as z:prior=json.loads(z.read('vortaforge-eol.json'))
   if prior['pack_id']!=ident or eol.manifest(src)!=prior['source_manifest']:raise ValueError('Source does not match saved source manifest: '+ident)
   target=Path(temp)/ident;policy=eol.generate(src,target,ident,True);archive=staging/name
   with zipfile.ZipFile(archive,'w',compression=zipfile.ZIP_DEFLATED,compresslevel=9) as z:
    for f in sorted(target.rglob('*')):
     if f.is_file():
      zi=zipfile.ZipInfo(f.relative_to(target).as_posix(),(2020,1,1,0,0,0));zi.compress_type=zipfile.ZIP_DEFLATED;zi.external_attr=0o644<<16;z.writestr(zi,f.read_bytes(),compress_type=zipfile.ZIP_DEFLATED,compresslevel=9)
   with zipfile.ZipFile(archive) as z:
    if z.testzip():raise ValueError('ZIP CRC failed: '+ident)
   entry=dict(r);entry.update(sha256=hashlib.sha256(archive.read_bytes()).hexdigest(),function_count=len(policy['guarded_functions']),guard_mode=policy['entry_guard_mode'],runtime_validated=False);results.append(entry)
  manifest['generated_candidates']=results;(staging/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n',encoding='utf-8')
  if output.exists() or output.is_symlink():raise ValueError('Output appeared during build')
  os.rename(staging,output)
 return len(results)

def main():
 p=argparse.ArgumentParser();p.add_argument('--source-root',type=Path,required=True);p.add_argument('--existing',type=Path,default=CORE/'archived/eol-candidates');p.add_argument('--output',type=Path,required=True);a=p.parse_args();print('Rebuilt',rebuild(a.source_root,a.existing,a.output),'unvalidated candidates; no server contacted.')
if __name__=='__main__':main()
