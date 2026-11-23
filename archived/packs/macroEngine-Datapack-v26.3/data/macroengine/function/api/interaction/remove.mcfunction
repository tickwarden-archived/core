# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/interaction/remove [MACRO]
execute if data storage macroengine:engine modules{interaction:0b} run return 0
$kill @e[type=minecraft:interaction,tag=macroengine.interaction,tag=$(tag)]
