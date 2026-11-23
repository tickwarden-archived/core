# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/get/xp [MACRO]
data modify storage macroengine:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage macroengine:output found set value 1b
$execute as @a[name=$(player),limit=1] store result storage macroengine:output level int 1 run data get entity @s XpLevel
$execute as @a[name=$(player),limit=1] store result storage macroengine:output points int 1 run xp query @s points
$execute as @a[name=$(player),limit=1] store result storage macroengine:output progress int 1000 run data get entity @s XpP
