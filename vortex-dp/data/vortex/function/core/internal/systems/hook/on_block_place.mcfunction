# vortex:core/internal/systems/hook/on_block_place
# @s = the triggering player
data modify storage vortex:engine _hook_fire_tmp set value {event:"block_place"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
