# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/flag/toggle [MACRO]
scoreboard players set $ftgl macroengine.tmp 0
$execute if data storage macroengine:engine flags.$(key) run scoreboard players set $ftgl macroengine.tmp 1

$execute if score $ftgl macroengine.tmp matches 1 run data remove storage macroengine:engine flags.$(key)
execute if score $ftgl macroengine.tmp matches 1 run data modify storage macroengine:output result set value 0b

$execute if score $ftgl macroengine.tmp matches 0 run data modify storage macroengine:engine flags.$(key) set value 1b
execute if score $ftgl macroengine.tmp matches 0 run data modify storage macroengine:output result set value 1b
