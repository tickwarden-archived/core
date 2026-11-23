# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/player/run/func_as_uuid [MACRO]
$data modify storage vortex:engine _dispatch.func set value "$(func)"
$execute as @a[nbt={UUID:$(uuid)}] run function #vortex:internal/dispatch
