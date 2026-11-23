# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/perm/group/remove [MACRO]  INPUT: $(player) $(group)
# Removes an online player from a group: drops the group.<group> tag and
# the perm.<name> tag of every permission in the group. KNOWN LIMIT: if
# the same permission was also granted directly (api/perm/grant) or via a
# second group, the storage record from grant survives but the tag is
# removed here - re-grant it if the player must keep it. Admin-only.

execute if data storage vortex:engine modules{perm:0b} run return 0
execute if entity @s unless entity @s[tag=vortex.admin] run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"translate":"vortex.msg.permission_denied","color":"red"}]
execute if entity @s unless entity @s[tag=vortex.admin] run return 0
$data modify storage vortex:validate in.value set value "$(group)"
execute unless function vortex:systems/validate/safe_name run return 0
$data modify storage vortex:validate in.value set value "$(player)"
execute unless function vortex:systems/validate/safe_name run return 0
scoreboard players set $grp_pid vortex.tmp 0
$execute store result score $grp_pid vortex.tmp run data get storage vortex:engine player_pids.$(player)
execute if score $grp_pid vortex.tmp matches 0 run return 0
$execute unless data storage vortex:engine groups.$(group) run return 0
data modify storage vortex:engine _grp_tmp set value {mode:"remove",pending:[]}
$data modify storage vortex:engine _grp_tmp.pending set from storage vortex:engine groups.$(group)
$execute as @a if score @s vortex.pid = $grp_pid vortex.tmp run tag @s remove group.$(group)
function vortex:core/internal/api/perm/group/_apply_loop
data remove storage vortex:engine _grp_tmp
return 1
