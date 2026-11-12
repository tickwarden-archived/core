# vortex:systems/hook/internal/on_level_up
# @s = the triggering player
data modify storage vortex:engine _hook_fire_tmp set value {event:"level_up"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
