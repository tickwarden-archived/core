# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/events/fire_deferred
function vortex:events/fire with storage vortex:engine queue[0]
