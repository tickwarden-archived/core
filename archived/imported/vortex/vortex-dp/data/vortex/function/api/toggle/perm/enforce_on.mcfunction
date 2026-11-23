# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/toggle/perm/enforce_on
# Turn permission enforcement ON: api/perm/require and api/perm/check enforce again.

# Who may flip it: a server/console executor (no entity) or a player with the vortex.admin tag.
execute if entity @s unless entity @s[tag=vortex.admin] run playsound vortex:perm.denied master @s ~ ~ ~ 1 1
execute if entity @s unless entity @s[tag=vortex.admin] run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"translate":"vortex.msg.permission_denied","color":"red"}]
execute if entity @s unless entity @s[tag=vortex.admin] run return 0

data modify storage vortex:engine config.perm_enforce set value 1b
function vortex:core/config/apply
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"perm enforcement","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"on","color":"green"}]
