# vortex:api/state/get_score
# Prints the calling player's current state score.
# Usage: /function vortex:api/state/get_score
tellraw @s ["",{"text":"[State] ","color":"aqua"},{"text":"current: ","color":"gray"},{"score":{"name":"@s","objective":"vortex.state"},"color":"white","bold":true}]
