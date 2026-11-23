# vortex:core/internal/systems/hook/on_eat_fire
# @s = the eating player
data modify storage vortex:engine _hook_fire_tmp set value {event:"eat"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
