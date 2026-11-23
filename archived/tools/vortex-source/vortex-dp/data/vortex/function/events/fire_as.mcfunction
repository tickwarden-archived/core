# vortex:events/fire_as [MACRO]
$data modify storage vortex:engine event_context.player set value "$(player)"

function vortex:events/fire with storage vortex:input {}

data remove storage vortex:engine event_context.player
