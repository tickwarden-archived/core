# vortex:api/player/var/has [MACRO]
data modify storage vortex:output result set value 0b
$execute if data storage vortex:engine players.$(player).$(key) run data modify storage vortex:output result set value 1b
