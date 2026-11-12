# vortex:systems/hook/internal/on_sneak_start
# @s = player who triggered the event
data modify storage vortex:engine _hook_fire_tmp set value {event:"sneak_start"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
