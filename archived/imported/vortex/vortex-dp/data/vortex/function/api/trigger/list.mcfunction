# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/trigger/list
execute if data storage vortex:engine modules{trigger:0b} run return 0
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━ Trigger Binds ","color":"aqua"},{"text":"━━━━━━━━━━━━━","color":"#555555"}]
execute unless data storage vortex:engine trigger_binds[0] run tellraw @s ["",{"text":" ","color":"#555555"},{"text":"(no binds registered)","color":"gray","italic":true}]
execute if data storage vortex:engine trigger_binds[0] run tellraw @s ["",{"text":" ","color":"#555555"},{"nbt":"trigger_binds","plain":true ,"storage":"vortex:engine","interpret":false,"color":"yellow"}]
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
