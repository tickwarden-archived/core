# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/player/get/health [MACRO]
data modify storage vortex:output found set value 0b

$execute unless entity @a[name=$(player),limit=1] run return 0

data modify storage vortex:output found set value 1b
$execute as @a[name=$(player),limit=1] store result storage vortex:output result int 1 run data get entity @s Health
$execute as @a[name=$(player),limit=1] store result storage vortex:output max int 1 run data get entity @s Attributes[{Name:"minecraft:max_health"}].Base
