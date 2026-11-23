# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/lib/for_each/entity [MACRO]
$data modify storage vortex:engine _dispatch.func set value "$(func)"
$execute as @e[type=$(type),tag=$(tag)] run function #vortex:internal/dispatch
