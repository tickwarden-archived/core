# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:events/fire [MACRO]
$execute unless data storage vortex:engine events.$(event) run return 0

$data modify storage vortex:engine _event_tmp set from storage vortex:engine events.$(event)
execute if data storage vortex:engine _event_tmp[0] run function vortex:core/internal/events/fire_next
data remove storage vortex:engine _event_tmp
