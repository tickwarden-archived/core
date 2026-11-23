"""Offline model of the exact generated lifecycle commands; not Minecraft runtime."""
import json,re,unittest,zipfile
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2];FOLDER=ROOT/'archived/eol-candidates'

class LifecycleModel:
 def __init__(self,z,policy):
  self.ns=policy['namespace'];self.obj=policy['objective'];self.scores={};self.storage={};self.objectives=set();self.messages=[];self.funcs={}
  prefix='data/'+self.ns+'/'
  for path in z.namelist():
   if path.startswith(prefix) and path.endswith('.mcfunction'):
    name=path.split('/')[-1][:-11];text=z.read(path).decode('utf-8');self.funcs[name]=text.replace(self.ns,'NS').replace(self.obj,'OBJ')
 def matches(self,val,expr):
  if val is None:return False
  if '..' in expr:
   a,b=expr.split('..');return (not a or val>=int(a)) and (not b or val<=int(b))
  return val==int(expr)
 def run_function(self,name):
  if name not in self.funcs:raise ValueError('missing lifecycle function '+name)
  for line in self.funcs[name].splitlines():
   if line and not line.startswith('#'):self.command(line)
 def command(self,s):
  if s.startswith('function NS:'):self.run_function(s.split(':',1)[1]);return
  if s.startswith('tellraw @a '):self.messages.append(json.loads(s[len('tellraw @a '):])['text']);return
  if s=='scoreboard objectives add OBJ dummy':
   if 'OBJ' in self.objectives:raise ValueError('objective added twice')
   self.objectives.add('OBJ');return
  if s=='data modify storage NS:lifecycle initialized set value 1b':self.storage['initialized']=1;return
  m=re.fullmatch(r'scoreboard players (add|set) (#\w+) OBJ (-?\d+)',s)
  if m:
   op,key,n=m.groups();self.scores[key]=(self.scores.get(key,0)+int(n)) if op=='add' else int(n);return
  m=re.fullmatch(r'scoreboard players operation (#\w+) OBJ = (#\w+) OBJ',s)
  if m:self.scores[m[1]]=self.scores[m[2]];return
  if s=='execute store result storage NS:lifecycle phase int 1 run scoreboard players get #phase OBJ':self.storage['phase']=self.scores['#phase'];return
  if s.startswith('execute '):
   conditions,action=s[len('execute '):].split(' run ',1)
   while conditions:
    m=re.match(r'(if|unless) score (#\w+) OBJ matches ([\d.]+)(?: |$)',conditions)
    if m:
     kind,key,expr=m.groups();ok=self.matches(self.scores.get(key),expr)
    else:
     m=re.match(r'(if|unless) score (#\w+) OBJ = (#\w+) OBJ(?: |$)',conditions)
     if m:
      kind,a,b=m.groups();ok=a in self.scores and b in self.scores and self.scores[a]==self.scores[b]
     else:
      m=re.match(r'(if|unless) data storage NS:lifecycle initialized(?: |$)',conditions)
      if not m:raise ValueError('unsupported execute condition: '+conditions)
      kind=m[1];ok='initialized' in self.storage
    if (kind=='if' and not ok) or (kind=='unless' and ok):return
    conditions=conditions[m.end():]
   self.command(action);return
  raise ValueError('unsupported lifecycle command: '+s)

class OfflineLifecycleTests(unittest.TestCase):
 def test_generated_lifecycle_boundaries_and_reload(self):
  records=json.loads((FOLDER/'manifest.json').read_text(encoding='utf-8'))['generated_candidates']
  for rec in records:
   with self.subTest(candidate=rec['id']),zipfile.ZipFile(FOLDER/rec['archive']) as z:
    p=json.loads(z.read('vortaforge-eol.json'));m=LifecycleModel(z,p);m.run_function('load')
    self.assertEqual((m.scores['#ticks'],m.storage['phase'],len(m.messages)),(0,1,1))
    m.run_function('load');self.assertEqual((m.scores['#ticks'],len(m.messages)),(0,1))
    m.scores['#ticks']=p['read_only_at_ticks']-2;m.run_function('tick');self.assertEqual((m.scores['#ticks'],m.storage['phase'],len(m.messages)),(p['read_only_at_ticks']-1,1,1))
    m.run_function('tick');self.assertEqual((m.scores['#ticks'],m.storage['phase'],len(m.messages)),(p['read_only_at_ticks'],2,2))
    m.run_function('load');self.assertEqual((m.scores['#ticks'],len(m.messages)),(p['read_only_at_ticks'],2))
    m.scores['#ticks']=p['locked_at_ticks']-1;m.run_function('tick');self.assertEqual((m.scores['#ticks'],m.storage['phase'],m.scores['#cleaned'],len(m.messages)),(p['locked_at_ticks'],3,1,3))
    m.run_function('tick');m.run_function('load');self.assertEqual((m.scores['#ticks'],len(m.messages)),(p['locked_at_ticks'],3))
