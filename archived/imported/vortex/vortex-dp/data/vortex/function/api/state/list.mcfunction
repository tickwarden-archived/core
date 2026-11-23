# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/state/list
tellraw @a[tag=vortex.admin] ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━ Player States ","color":"aqua"},{"text":"━━━━━━━━━━","color":"#555555"}]
execute if data storage vortex:engine states run tellraw @a[tag=vortex.admin] ["",{"text":" ","color":"#555555"},{"plain":true ,"storage":"vortex:engine","nbt":"states","interpret":false,"color":"white"}]
execute unless data storage vortex:engine states run tellraw @a[tag=vortex.admin] ["",{"text":" ","color":"#555555"},{"text":"(no active states)","color":"gray","italic":true}]
tellraw @a[tag=vortex.admin] ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
