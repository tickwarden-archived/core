# vortex:systems/hook/internal/on_hero_of_the_village
# @s = player who triggered the event
data modify storage vortex:engine _hook_fire_tmp set value {event:"hero_of_the_village"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
