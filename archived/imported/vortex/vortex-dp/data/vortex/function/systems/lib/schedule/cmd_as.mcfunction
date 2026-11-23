# vortex:systems/lib/schedule/cmd_as [MACRO]
$execute if data storage vortex:engine schedules.$(key) run data remove storage vortex:engine schedules.$(key)

$data modify storage vortex:engine schedules.$(key).cmd set value "$(cmd)"
$data modify storage vortex:engine schedules.$(key).interval set value $(interval)
$data modify storage vortex:engine schedules.$(key).player set value "$(player)"
$data modify storage vortex:engine queue append value {cmd:"$(cmd)", delay:$(interval), player:"$(player)"}
