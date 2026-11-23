# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/var/increment [MACRO]
$execute store result score $pvar macroengine.tmp run data get storage macroengine:engine players.$(player).$(key)
scoreboard players add $pvar macroengine.tmp 1
$execute store result storage macroengine:engine players.$(player).$(key) int 1 run scoreboard players get $pvar macroengine.tmp
execute store result storage macroengine:output result int 1 run scoreboard players get $pvar macroengine.tmp
