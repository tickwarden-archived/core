# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/math/max [MACRO]
execute if data storage macroengine:engine modules{math:0b} run return 0
$scoreboard players set $max_a macroengine.tmp $(a)
$scoreboard players set $max_b macroengine.tmp $(b)

execute store result storage macroengine:output result int 1 run scoreboard players get $max_a macroengine.tmp

execute if score $max_b macroengine.tmp > $max_a macroengine.tmp run execute store result storage macroengine:output result int 1 run scoreboard players get $max_b macroengine.tmp
