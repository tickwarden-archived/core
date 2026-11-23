# vortex:systems/lib/for_each/player [MACRO]
$data modify storage vortex:engine _dispatch.func set value "$(func)"
execute as @a run function #vortex:internal/dispatch
