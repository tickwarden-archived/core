# vortex:api/perm/group/create [MACRO]  INPUT: $(group)
# Creates an empty permission group. A group's permissions become effective
# through the existing perm.<name> tags when the group is assigned, so
# api/perm/require does not change. Admin-only, like api/perm/grant.
# The group name must pass systems/validate/safe_name before any macro
# line uses it (letters, digits, underscore, dot, hyphen).

execute if data storage vortex:engine modules{perm:0b} run return 0
execute if entity @s unless entity @s[tag=vortex.admin] run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"translate":"vortex.msg.permission_denied","color":"red"}]
execute if entity @s unless entity @s[tag=vortex.admin] run return 0
$data modify storage vortex:validate in.value set value "$(group)"
execute unless function vortex:systems/validate/safe_name run return 0
execute unless data storage vortex:engine groups run data modify storage vortex:engine groups set value {}
$execute unless data storage vortex:engine groups.$(group) run data modify storage vortex:engine groups.$(group) set value []
return 1
