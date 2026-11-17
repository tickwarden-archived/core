# vortex:api/player/team/has [MACRO]
data modify storage vortex:output result set value 0b
$execute if entity @a[name=$(player),team=$(team)] run data modify storage vortex:output result set value 1b
