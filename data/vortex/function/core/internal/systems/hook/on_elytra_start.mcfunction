# vortex:systems/hook/internal/on_elytra_start
# @s = player who triggered the event
data modify storage vortex:engine _hook_fire_tmp set value {event:"elytra_start"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
