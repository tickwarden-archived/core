# vortex:systems/flag/get [MACRO]
data modify storage vortex:output result set value 0b
$execute if data storage vortex:engine flags.$(key) run data modify storage vortex:output result set value 1b
