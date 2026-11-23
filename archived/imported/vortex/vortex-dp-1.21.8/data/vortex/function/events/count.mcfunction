# vortex:events/count [MACRO]
data modify storage vortex:output result set value 0
$execute if data storage vortex:engine events.$(event) run execute store result storage vortex:output result int 1 run data get storage vortex:engine events.$(event)
