# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/interaction/check_bind [MACRO]
$data modify storage macroengine:engine _dispatch.func set value "$(func)"
$execute if entity @e[type=minecraft:interaction,tag=macroengine.ia_active,tag=$(tag),limit=1] run function #macroengine:internal/dispatch
