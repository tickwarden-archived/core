# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/math/log2 [MACRO]
execute if data storage macroengine:engine modules{math:0b} run return 0
$scoreboard players set $lg2_v macroengine.tmp $(value)

execute if score $lg2_v macroengine.tmp matches ..0 run data modify storage macroengine:output result set value -1
execute if score $lg2_v macroengine.tmp matches ..0 run return 0

scoreboard players set $lg2_r macroengine.tmp 0
scoreboard players set $lg2_2 macroengine.tmp 2

function macroengine:core/internal/systems/math/log2_loop

execute store result storage macroengine:output result int 1 run scoreboard players get $lg2_r macroengine.tmp
