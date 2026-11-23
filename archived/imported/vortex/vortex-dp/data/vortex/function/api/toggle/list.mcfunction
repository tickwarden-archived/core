# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/toggle/list
# Prints the enabled/disabled state of all DL modules.
#
# Usage:  function vortex:api/toggle/list
# Caller: vortex.admin tag required

execute unless entity @s[tag=vortex.admin] run return 0

tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━ Module States ━━━━━━━━━━━━━━━","color":"#555555"}]
tellraw @s ["",{"text":" ","color":"#555555"},{"plain":true ,"storage":"vortex:engine","nbt":"modules","interpret":false,"color":"yellow"}]
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
