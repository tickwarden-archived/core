# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/flag/toggle [MACRO]
scoreboard players set $ftgl vortex.tmp 0
$execute if data storage vortex:engine flags.$(key) run scoreboard players set $ftgl vortex.tmp 1

$execute if score $ftgl vortex.tmp matches 1 run data remove storage vortex:engine flags.$(key)
execute if score $ftgl vortex.tmp matches 1 run data modify storage vortex:output result set value 0b

$execute if score $ftgl vortex.tmp matches 0 run data modify storage vortex:engine flags.$(key) set value 1b
execute if score $ftgl vortex.tmp matches 0 run data modify storage vortex:output result set value 1b
