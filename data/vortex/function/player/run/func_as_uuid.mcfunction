# vortex:player/run/func_as_uuid [MACRO]
$data modify storage vortex:engine _dispatch.func set value "$(func)"
$execute as @a[nbt={UUID:$(uuid)}] run function #vortex:internal/dispatch
