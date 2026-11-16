# vortex:core/internal/systems/hook/on_advancement_fire [MACRO]
# INPUT: $(advancement)
# @s = player who earned the advancement

$data modify storage vortex:engine _hook_fire_tmp set value {event:"advancement:$(advancement)"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp
