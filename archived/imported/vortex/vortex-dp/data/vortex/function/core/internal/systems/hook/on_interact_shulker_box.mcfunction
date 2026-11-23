# vortex:core/internal/systems/hook/on_interact_shulker_box
# @s = player who triggered the event
data modify storage vortex:engine _hook_fire_tmp set value {event:"interact_shulker_box"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
