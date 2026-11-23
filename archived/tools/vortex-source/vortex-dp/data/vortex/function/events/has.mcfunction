# vortex:events/has [MACRO]
data modify storage vortex:output result set value 0b
$execute if data storage vortex:engine events.$(event) run data modify storage vortex:output result set value 1b
