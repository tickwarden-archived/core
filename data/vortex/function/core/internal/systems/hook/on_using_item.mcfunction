# vortex:systems/hook/internal/on_using_item
# @s = player who triggered the event
data modify storage vortex:engine _hook_fire_tmp set value {event:"using_item"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
