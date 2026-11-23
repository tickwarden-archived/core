# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/math/mod [MACRO]
execute if data storage macroengine:engine modules{math:0b} run return 0
$scoreboard players set $mod_v macroengine.tmp $(value)
$scoreboard players set $mod_d macroengine.tmp $(divisor)

execute if score $mod_d macroengine.tmp matches ..0 run data modify storage macroengine:output result set value 0
execute if score $mod_d macroengine.tmp matches ..0 run return 0

scoreboard players operation $mod_v macroengine.tmp %= $mod_d macroengine.tmp

execute if score $mod_v macroengine.tmp matches ..-1 run scoreboard players operation $mod_v macroengine.tmp += $mod_d macroengine.tmp

execute store result storage macroengine:output result int 1 run scoreboard players get $mod_v macroengine.tmp
