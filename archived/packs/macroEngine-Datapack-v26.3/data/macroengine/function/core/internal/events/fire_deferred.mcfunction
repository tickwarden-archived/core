# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/events/fire_deferred
function macroengine:events/fire with storage macroengine:engine queue[0]
