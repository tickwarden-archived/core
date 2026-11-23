# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/hook/on_entity_kill
# @s = player who triggered the event
data modify storage vortex:engine _hook_fire_tmp set value {event:"entity_kill"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
