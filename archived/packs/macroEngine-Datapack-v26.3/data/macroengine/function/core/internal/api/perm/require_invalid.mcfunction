# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/perm/require_invalid  [INTERNAL]
# The permission name failed validation. The raw value is NOT echoed or stored.
playsound macroengine:perm.denied master @s ~ ~ ~ 1 1
tellraw @s ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"translate":"macroengine.msg.require_invalid","color":"red"}]
data modify storage macroengine:audit in set value {action:"perm.require.invalid",detail:"rejected permission name"}
function macroengine:systems/audit/record
