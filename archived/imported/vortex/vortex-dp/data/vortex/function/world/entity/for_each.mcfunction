# vortex:world/entity/for_each [MACRO]
$data modify storage vortex:engine _dispatch.func set value "$(func)"
$execute as @e[type=$(type),tag=$(tag)] at @s run function #vortex:internal/dispatch
