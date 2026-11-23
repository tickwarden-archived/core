# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/flag/toggle_system/flip [MACRO, INTERNAL]  $(key) is one of the five literal sys_* keys
# The old exec flipped a score 1 -> 0 and then 0 -> 1 in the same call, so it never changed anything.
# Here the state is read once into #cfg_f and exactly one branch writes.
$execute store success score #cfg_f macroengine.tmp if data storage macroengine:engine config{$(key):0b}
$execute if score #cfg_f macroengine.tmp matches 1 run data modify storage macroengine:engine config.$(key) set value 1b
$execute if score #cfg_f macroengine.tmp matches 0 run data modify storage macroengine:engine config.$(key) set value 0b
function macroengine:core/config/apply
return 1
