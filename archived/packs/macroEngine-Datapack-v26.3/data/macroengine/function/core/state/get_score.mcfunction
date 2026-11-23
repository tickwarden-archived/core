# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/state/get_score
# Prints the calling player's current state score.
# Usage: /function macroengine:core/state/get_score
tellraw @s ["",{"text":"[State] ","color":"aqua"},{"text":"current: ","color":"gray"},{"score":{"name":"@s","objective":"macroengine.state"},"color":"white","bold":true}]
