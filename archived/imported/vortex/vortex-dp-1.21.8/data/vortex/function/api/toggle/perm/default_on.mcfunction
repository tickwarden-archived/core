# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/toggle/perm/default_on
# Make "enforcement on" the DEFAULT. Takes effect when perm_enforce is created or reset (core/config/reset); it does not change the current state.

# Who may flip it: a server/console executor (no entity) or a player with the vortex.admin tag.
execute if entity @s unless entity @s[tag=vortex.admin] run playsound vortex:perm.denied master @s ~ ~ ~ 1 1
execute if entity @s unless entity @s[tag=vortex.admin] run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"translate":"vortex.msg.permission_denied","color":"red"}]
execute if entity @s unless entity @s[tag=vortex.admin] run return 0

data modify storage vortex:engine perm_default set value 1b
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"perm default","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"on","color":"green"}]
