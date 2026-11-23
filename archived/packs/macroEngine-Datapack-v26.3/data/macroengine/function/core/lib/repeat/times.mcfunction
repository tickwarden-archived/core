# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/lib/repeat/times [MACRO]
$scoreboard players set $rn_n macroengine.tmp $(n)
scoreboard players set $rn_i macroengine.tmp 0

execute if score $rn_n macroengine.tmp matches ..0 run return 0

$data modify storage macroengine:engine _rn_func set value "$(func)"
function macroengine:core/internal/core/lib/repeat/times_loop
data remove storage macroengine:engine _rn_func
