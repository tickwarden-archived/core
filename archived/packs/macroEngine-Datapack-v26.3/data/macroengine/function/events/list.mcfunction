# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:events/list
tellraw @s ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"━━━ Registered Events ","color":"aqua"},{"text":"━━━━━━","color":"#555555"}]
execute if data storage macroengine:engine events run tellraw @s ["",{"text":" ","color":"#555555"},{"plain":true ,"storage":"macroengine:engine","nbt":"events","interpret":false,"color":"yellow"}]
execute unless data storage macroengine:engine events run tellraw @s ["",{"text":" ","color":"#555555"},{"text":"(no registered events)","color":"gray","italic":true}]
tellraw @s ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
