# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:world/entity/for_each [MACRO]
$data modify storage macroengine:engine _dispatch.func set value "$(func)"
$execute as @e[type=$(type),tag=$(tag)] at @s run function #macroengine:internal/dispatch
