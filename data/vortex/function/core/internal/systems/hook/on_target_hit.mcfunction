# vortex:systems/hook/internal/on_target_hit
data modify storage vortex:engine _hook_fire_tmp set value {event:"target_hit"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
