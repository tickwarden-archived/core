# vortex:core/state/get [MACRO]
data remove storage vortex:output result
$execute if data storage vortex:engine states.$(player) run data modify storage vortex:output result set from storage vortex:engine states.$(player)
