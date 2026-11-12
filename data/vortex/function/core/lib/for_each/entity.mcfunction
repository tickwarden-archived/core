# vortex:core/lib/for_each/entity [MACRO]
$data modify storage vortex:engine _dispatch.func set value "$(func)"
$execute as @e[type=$(type),tag=$(tag)] run function #vortex:internal/dispatch
