# vortex:events/list
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━ Registered Events ","color":"aqua"},{"text":"━━━━━━","color":"#555555"}]
execute if data storage vortex:engine events run tellraw @s ["",{"text":" ","color":"#555555"},{"plain":true ,"storage":"vortex:engine","nbt":"events","interpret":false,"color":"yellow"}]
execute unless data storage vortex:engine events run tellraw @s ["",{"text":" ","color":"#555555"},{"text":"(no registered events)","color":"gray","italic":true}]
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
