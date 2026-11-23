# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/toggle/wand/true — Enable the wand module

execute unless entity @s[tag=macroengine.admin] run return 0

data modify storage macroengine:engine config.module_wand set value 1b
function macroengine:core/config/apply

tellraw @s ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"wand","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"enabled","color":"green"}]
