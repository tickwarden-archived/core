# vortex:systems/hook/internal/on_player_death
# @s = the triggering player
data modify storage vortex:engine _hook_fire_tmp set value {event:"player_death"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp

# Event bus
function #vortex:events/on_death
