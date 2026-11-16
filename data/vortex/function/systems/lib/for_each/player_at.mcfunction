# vortex:systems/lib/for_each/player_at [MACRO]
$data modify storage vortex:engine _dispatch.func set value "$(func)"
execute as @a at @s run function #vortex:internal/dispatch
