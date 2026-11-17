# vortex:api/perm/list [MACRO]
execute if data storage vortex:engine modules{perm:0b} run return 0
$tellraw @s["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━ Perms: ","color":"aqua"},{"text":"$(player)","color":"white","bold":true},{"text":" ━━━━━━━━━━━━━━","color":"#555555"}]
$execute if data storage vortex:engine permissions.$(player) run tellraw @s ["",{"text":" ","color":"#555555"},{"plain":true ,"storage":"vortex:engine","nbt":"permissions.$(player)","interpret":false,"color":"yellow"}]
$execute unless data storage vortex:engine permissions.$(player) run tellraw @s ["",{"text":" ","color":"#555555"},{"text":"(no permissions)","color":"gray","italic":true}]
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
