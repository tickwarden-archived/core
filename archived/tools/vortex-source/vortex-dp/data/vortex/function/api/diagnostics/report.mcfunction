# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/diagnostics/report
# Prints a human-readable health report to @s. Collects first (systems/diagnostics/collect), so the
# data is also left in vortex:output diagnostics. Read-only: it never changes engine state.
#
# Usage:  function vortex:api/diagnostics/report
# Caller: vortex.admin tag required

execute unless entity @s[tag=vortex.admin] run return 0

function vortex:systems/diagnostics/collect

tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━ Diagnostics ━━━━━━━━━━━━━━━━━","color":"#555555"}]
execute if data storage vortex:output diagnostics{ok:1b} run tellraw @s ["",{"text":" status ","color":"gray"},{"text":"OK","color":"green","bold":true}]
execute if data storage vortex:output diagnostics{ok:0b} run tellraw @s ["",{"text":" status ","color":"gray"},{"text":"ISSUES","color":"red","bold":true},{"text":" (","color":"#555555"},{"storage":"vortex:output","nbt":"diagnostics.issue_count","color":"red"},{"text":")","color":"#555555"}]
execute if data storage vortex:output diagnostics.issues[0] run tellraw @s ["",{"text":" issues ","color":"gray"},{"plain":true,"storage":"vortex:output","nbt":"diagnostics.issues[]","separator":", ","interpret":false,"color":"red"}]
execute if data storage vortex:output diagnostics.notices[0] run tellraw @s ["",{"text":" notices ","color":"gray"},{"plain":true,"storage":"vortex:output","nbt":"diagnostics.notices[]","separator":", ","interpret":false,"color":"yellow"}]
tellraw @s ["",{"text":" modules ","color":"gray"},{"storage":"vortex:output","nbt":"diagnostics.modules.enabled","color":"green"},{"text":" on / ","color":"gray"},{"storage":"vortex:output","nbt":"diagnostics.modules.disabled","color":"red"},{"text":" off","color":"gray"}]
tellraw @s ["",{"text":" queue   ","color":"gray"},{"storage":"vortex:output","nbt":"diagnostics.queue.size","color":"white"},{"text":" / cap ","color":"gray"},{"storage":"vortex:output","nbt":"diagnostics.queue.cap","color":"white"}]
tellraw @s ["",{"text":" audit   ","color":"gray"},{"storage":"vortex:output","nbt":"diagnostics.audit.count","color":"white"},{"text":" entries   log level ","color":"gray"},{"storage":"vortex:output","nbt":"diagnostics.log.level","color":"white"},{"text":" (","color":"#555555"},{"storage":"vortex:output","nbt":"diagnostics.log.buffered","color":"white"},{"text":" buffered)","color":"#555555"}]
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
