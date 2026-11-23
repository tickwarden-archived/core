# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:events/fire_to_player [MACRO]
$execute unless data storage vortex:engine events.$(event) run return 0

$data modify storage vortex:engine _event_tmp set from storage vortex:engine events.$(event)

$execute as @a[name=$(player),limit=1] run function vortex:core/internal/events/fire_next
data remove storage vortex:engine _event_tmp
