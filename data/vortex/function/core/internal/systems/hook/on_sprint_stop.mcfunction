# vortex:systems/hook/internal/on_sprint_stop
# @s = player who triggered the event
data modify storage vortex:engine _hook_fire_tmp set value {event:"sprint_stop"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
