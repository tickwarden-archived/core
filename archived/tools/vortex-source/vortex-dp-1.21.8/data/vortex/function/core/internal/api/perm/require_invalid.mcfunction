# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/perm/require_invalid  [INTERNAL]
# The permission name failed validation. The raw value is NOT echoed or stored.
playsound vortex:perm.denied master @s ~ ~ ~ 1 1
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"translate":"vortex.msg.require_invalid","color":"red"}]
data modify storage vortex:audit in set value {action:"perm.require.invalid",detail:"rejected permission name"}
function vortex:systems/audit/record
