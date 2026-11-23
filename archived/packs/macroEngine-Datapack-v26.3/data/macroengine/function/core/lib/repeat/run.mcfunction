# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/lib/repeat/run [MACRO]
$data modify storage macroengine:engine _repeat.func set value "$(func)"
$scoreboard players set $rep_n macroengine.tmp $(count)
scoreboard players set $rep_i macroengine.tmp 0
execute store result storage macroengine:engine _repeat.i int 1 run scoreboard players get $rep_i macroengine.tmp
execute store result storage macroengine:engine _repeat.remaining int 1 run scoreboard players get $rep_n macroengine.tmp
function macroengine:core/internal/core/lib/repeat/run
data remove storage macroengine:engine _repeat
