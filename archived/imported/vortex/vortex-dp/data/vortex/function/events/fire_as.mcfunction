# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:events/fire_as [MACRO]
$data modify storage vortex:engine event_context.player set value "$(player)"

function vortex:events/fire with storage vortex:input {}

data remove storage vortex:engine event_context.player
