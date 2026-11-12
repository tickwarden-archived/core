# vortex:core/state/is [MACRO]
data modify storage vortex:output result set value 0b
$execute if data storage vortex:engine states{$(player):"$(state)"} run data modify storage vortex:output result set value 1b
