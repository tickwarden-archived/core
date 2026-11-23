# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/flag/toggle_system/flip [MACRO, INTERNAL]  $(key) is one of the five literal sys_* keys
# The old exec flipped a score 1 -> 0 and then 0 -> 1 in the same call, so it never changed anything.
# Here the state is read once into #cfg_f and exactly one branch writes.
$execute store success score #cfg_f vortex.tmp if data storage vortex:engine config{$(key):0b}
$execute if score #cfg_f vortex.tmp matches 1 run data modify storage vortex:engine config.$(key) set value 1b
$execute if score #cfg_f vortex.tmp matches 0 run data modify storage vortex:engine config.$(key) set value 0b
function vortex:core/config/apply
return 1
