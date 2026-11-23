# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/lib/schedule/list
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━ Active Schedules ","color":"aqua"},{"text":"━━━━━━━━━","color":"#555555"}]
execute if data storage vortex:engine schedules run tellraw @a[tag=vortex.admin] ["",{"text":" ","color":"#555555"},{"plain":true ,"storage":"vortex:engine","nbt":"schedules","interpret":false,"color":"gold"}]
execute unless data storage vortex:engine schedules run tellraw @a[tag=vortex.admin] ["",{"text":" ","color":"#555555"},{"text":"(no active schedules)","color":"gray","italic":true}]
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
