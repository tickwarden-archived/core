# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/var/transfer [MACRO]
$execute store result score $tr_f macroengine.tmp run data get storage macroengine:engine players.$(from).$(key)
$scoreboard players set $tr_a macroengine.tmp $(amount)
scoreboard players operation $tr_f macroengine.tmp -= $tr_a macroengine.tmp
$execute store result storage macroengine:engine players.$(from).$(key) int 1 run scoreboard players get $tr_f macroengine.tmp

$execute store result score $tr_t macroengine.tmp run data get storage macroengine:engine players.$(to).$(key)
scoreboard players operation $tr_t macroengine.tmp += $tr_a macroengine.tmp
$execute store result storage macroengine:engine players.$(to).$(key) int 1 run scoreboard players get $tr_t macroengine.tmp

execute store result storage macroengine:output result int 1 run scoreboard players get $tr_t macroengine.tmp
