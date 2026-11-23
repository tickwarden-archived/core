# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/player/var/list [MACRO]
$tellraw @a[tag=vortex.admin] ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━ Player: ","color":"aqua"},{"text":"$(player)","color":"white","bold":true},{"text":" ━━━━━━━━━━━━━━","color":"#555555"}]
$execute if data storage vortex:engine players.$(player) run tellraw @a[tag=vortex.admin] ["",{"text":" vars ","color":"#555555"},{"plain":true ,"storage":"vortex:engine","nbt":"players.$(player)","interpret":false,"color":"yellow"}]
$execute unless data storage vortex:engine players.$(player) run tellraw @a[tag=vortex.admin] ["",{"text":" vars ","color":"#555555"},{"text":"(no data)","color":"gray","italic":true}]
$execute if data storage vortex:engine cooldowns.$(player) run tellraw @a[tag=vortex.admin] ["",{"text":" cooldowns ","color":"#555555"},{"plain":true ,"storage":"vortex:engine","nbt":"cooldowns.$(player)","interpret":false,"color":"aqua"}]
$execute unless data storage vortex:engine cooldowns.$(player) run tellraw @a[tag=vortex.admin] ["",{"text":" cooldowns ","color":"#555555"},{"text":"(none active)","color":"gray","italic":true}]
tellraw @a[tag=vortex.admin] ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
