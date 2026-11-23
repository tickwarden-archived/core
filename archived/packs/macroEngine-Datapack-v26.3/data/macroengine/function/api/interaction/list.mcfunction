# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/interaction/list
execute if data storage macroengine:engine modules{interaction:0b} run return 0
tellraw @s ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"interaction/list","color":"aqua"}]
tellraw @s ["",{"text":" attack: ","color":"#555555"},{"plain":true ,"storage":"macroengine:engine","nbt":"interaction_binds.attack","color":"white","interpret":false}]
tellraw @s ["",{"text":" use: ","color":"#555555"},{"plain":true ,"storage":"macroengine:engine","nbt":"interaction_binds.use","color":"white","interpret":false}]
