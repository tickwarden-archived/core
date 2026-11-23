# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/log/clear
# Usage: /function macroengine:systems/log/clear
# Clears the log buffer.
execute if data storage macroengine:engine modules{log:0b} run return 0
execute unless entity @s[tag=macroengine.admin] run return 0
data remove storage macroengine:engine log_display
scoreboard players set #macroengine.log_count macroengine.tmp 0
tellraw @s ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"Log buffer cleared.","color":"gray"}]
