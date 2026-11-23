# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/wand/list — Shows registered wand binds.
execute if data storage vortex:engine modules{wand:0b} run return 0
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━ Wand Binds ","color":"aqua"},{"text":"━━━━━━━━━━━━━━━","color":"#555555"}]
execute unless data storage vortex:engine wand_binds[0] run tellraw @s ["",{"text":" ","color":"#555555"},{"text":"(no wand binds)","color":"gray","italic":true}]
execute if data storage vortex:engine wand_binds[0] run tellraw @s ["",{"text":" ","color":"#555555"},{"plain":true ,"storage":"vortex:engine","nbt":"wand_binds","interpret":false,"color":"yellow"}]
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
