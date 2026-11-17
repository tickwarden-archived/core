# vortex:events/unregister_one [MACRO]
$execute unless data storage vortex:engine events.$(event) run return 0

$data modify storage vortex:engine _uro.event set value "$(event)"
$data modify storage vortex:engine _uro.func set value "$(func)"
$data modify storage vortex:engine _uro.src set from storage vortex:engine events.$(event)

$data remove storage vortex:engine events.$(event)

execute if data storage vortex:engine _uro.src[0] run function vortex:core/internal/events/uro_loop

data remove storage vortex:engine _uro
