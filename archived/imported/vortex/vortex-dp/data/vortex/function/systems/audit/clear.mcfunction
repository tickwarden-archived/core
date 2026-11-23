# vortex:systems/audit/clear
# Empties the audit trail. ADMIN ONLY. Leaves one tombstone entry so the clear is itself
# recorded (who cleared it, and when).
#
# Usage:  function vortex:systems/audit/clear

execute if data storage vortex:engine modules{audit:0b} run return 0
execute if entity @s unless entity @s[tag=vortex.admin] run playsound vortex:perm.denied master @s ~ ~ ~ 1 1
execute if entity @s unless entity @s[tag=vortex.admin] run return run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"translate":"vortex.msg.permission_denied","color":"red"}]

data remove storage vortex:audit entries
data modify storage vortex:audit in set value {action:"audit.clear",detail:"entries cleared"}
function vortex:systems/audit/record
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"translate":"vortex.msg.audit_cleared","color":"green"}]
