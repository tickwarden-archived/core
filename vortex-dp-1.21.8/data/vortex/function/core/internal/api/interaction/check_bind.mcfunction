# vortex:core/internal/api/interaction/check_bind [MACRO]
$data modify storage vortex:engine _dispatch.func set value "$(func)"
$execute if entity @e[type=minecraft:interaction,tag=vortex.ia_active,tag=$(tag),limit=1] run function #vortex:internal/dispatch
