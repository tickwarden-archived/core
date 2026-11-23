# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/hook/on_fish_fire
# @s = the fishing player
data modify storage vortex:engine _hook_fire_tmp set value {event:"fish_caught"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
