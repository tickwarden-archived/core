# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/audit/show
# Prints the latest 10 audit entries to the caller. ADMIN ONLY (tag vortex.admin).
# A server/console executor (no entity) is treated as trusted, same as api/perm/grant.
#
# Usage:  function vortex:systems/audit/show

execute if data storage vortex:engine modules{audit:0b} run return 0
execute if entity @s unless entity @s[tag=vortex.admin] run playsound vortex:perm.denied master @s ~ ~ ~ 1 1
execute if entity @s unless entity @s[tag=vortex.admin] run return run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"translate":"vortex.msg.permission_denied","color":"red"}]

execute store result score #vortex.au_n vortex.tmp run data get storage vortex:audit entries
execute if score #vortex.au_n vortex.tmp matches ..0 run return run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"translate":"vortex.msg.audit_empty","color":"gray"}]

tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"translate":"vortex.msg.audit_header","color":"gray"}]

scoreboard players operation #vortex.au_i vortex.tmp = #vortex.au_n vortex.tmp
scoreboard players remove #vortex.au_i vortex.tmp 10
execute if score #vortex.au_i vortex.tmp matches ..-1 run scoreboard players set #vortex.au_i vortex.tmp 0
function vortex:core/internal/systems/audit/show_loop
data remove storage vortex:audit idx
