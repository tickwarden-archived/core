# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/player/get/pos [MACRO]
data modify storage vortex:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage vortex:output found set value 1b
$execute as @a[name=$(player),limit=1] at @s store result storage vortex:output x int 1 run data get entity @s Pos[0]
$execute as @a[name=$(player),limit=1] at @s store result storage vortex:output y int 1 run data get entity @s Pos[1]
$execute as @a[name=$(player),limit=1] at @s store result storage vortex:output z int 1 run data get entity @s Pos[2]
