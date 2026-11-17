# vortex:core/internal/systems/hook/on_drop
data modify storage vortex:engine _hook_fire_tmp set value {event:"drop_item"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
