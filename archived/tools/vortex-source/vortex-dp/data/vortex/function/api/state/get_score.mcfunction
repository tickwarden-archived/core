# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/state/get_score
# Prints the calling player's current state score.
# Usage: /function vortex:api/state/get_score
tellraw @s ["",{"text":"[State] ","color":"aqua"},{"text":"current: ","color":"gray"},{"score":{"name":"@s","objective":"vortex.state"},"color":"white","bold":true}]
