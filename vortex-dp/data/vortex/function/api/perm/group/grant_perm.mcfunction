# vortex:api/perm/group/grant_perm [MACRO]  INPUT: $(group) $(perm)
# Adds one permission name to an existing group. Players already in the
# group do not gain it until the group is assigned again - assignment is
# the moment membership is materialised into perm.<name> tags.
# Admin-only, like api/perm/grant; both names must pass safe_name.

execute if data storage vortex:engine modules{perm:0b} run return 0
execute if entity @s unless entity @s[tag=vortex.admin] run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"translate":"vortex.msg.permission_denied","color":"red"}]
execute if entity @s unless entity @s[tag=vortex.admin] run return 0
$data modify storage vortex:validate in.value set value "$(group)"
execute unless function vortex:systems/validate/safe_name run return 0
$data modify storage vortex:validate in.value set value "$(perm)"
execute unless function vortex:systems/validate/safe_name run return 0
$execute unless data storage vortex:engine groups.$(group) run return run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(group)","color":"yellow"},{"text":" - no such group; create it first.","color":"red"}]
$data modify storage vortex:engine groups.$(group) append value "$(perm)"
return 1
