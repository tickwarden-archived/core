# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/var/clamp [MACRO]
$execute store result score $cv macroengine.tmp run data get storage macroengine:engine players.$(player).$(key)
$scoreboard players set $cv_mn macroengine.tmp $(min)
$scoreboard players set $cv_mx macroengine.tmp $(max)
execute if score $cv macroengine.tmp < $cv_mn macroengine.tmp run scoreboard players operation $cv macroengine.tmp = $cv_mn macroengine.tmp
execute if score $cv macroengine.tmp > $cv_mx macroengine.tmp run scoreboard players operation $cv macroengine.tmp = $cv_mx macroengine.tmp
$execute store result storage macroengine:engine players.$(player).$(key) int 1 run scoreboard players get $cv macroengine.tmp
execute store result storage macroengine:output result int 1 run scoreboard players get $cv macroengine.tmp
