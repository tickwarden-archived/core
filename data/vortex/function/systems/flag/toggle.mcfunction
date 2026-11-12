# vortex:systems/flag/toggle [MACRO]
scoreboard players set $ftgl vortex.tmp 0
$execute if data storage vortex:engine flags.$(key) run scoreboard players set $ftgl vortex.tmp 1

$execute if score $ftgl vortex.tmp matches 1 run data remove storage vortex:engine flags.$(key)
execute if score $ftgl vortex.tmp matches 1 run data modify storage vortex:output result set value 0b

$execute if score $ftgl vortex.tmp matches 0 run data modify storage vortex:engine flags.$(key) set value 1b
execute if score $ftgl vortex.tmp matches 0 run data modify storage vortex:output result set value 1b
