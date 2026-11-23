# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/toggle/cb/true
data modify storage macroengine:engine config.module_cb set value 1b
function macroengine:core/config/apply

tellraw @s [{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"cb module: ","color":"aqua"},{"text":"enabled","color":"green"}]
