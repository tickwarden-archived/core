# vortex:systems/hook/internal/on_open_chest
data modify storage vortex:engine _hook_fire_tmp set value {event:"open_chest"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
