# vortex:api/player/online_check [MACRO]
data modify storage vortex:output result set value 0b
$execute if entity @a[name=$(player),limit=1] run data modify storage vortex:output result set value 1b
