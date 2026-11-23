# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/interaction/list
execute if data storage vortex:engine modules{interaction:0b} run return 0
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"interaction/list","color":"aqua"}]
tellraw @s ["",{"text":" attack: ","color":"#555555"},{"plain":true ,"storage":"vortex:engine","nbt":"interaction_binds.attack","color":"white","interpret":false}]
tellraw @s ["",{"text":" use: ","color":"#555555"},{"plain":true ,"storage":"vortex:engine","nbt":"interaction_binds.use","color":"white","interpret":false}]
