# vortex:core/internal/systems/hook/on_sprint_start
# @s = player who triggered the event
data modify storage vortex:engine _hook_fire_tmp set value {event:"sprint_start"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
