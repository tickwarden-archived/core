# vortex:core/internal/systems/hook/on_player_respawn
# @s = the triggering player
data modify storage vortex:engine _hook_fire_tmp set value {event:"player_respawn"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp

# Event bus
function #vortex:events/on_respawn
