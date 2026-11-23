# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/hook/on_level_up
# @s = the triggering player
data modify storage vortex:engine _hook_fire_tmp set value {event:"level_up"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
