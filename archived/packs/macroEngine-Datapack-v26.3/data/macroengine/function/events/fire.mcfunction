# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:events/fire [MACRO]
$execute unless data storage macroengine:engine events.$(event) run return 0

$data modify storage macroengine:engine _event_tmp set from storage macroengine:engine events.$(event)
execute if data storage macroengine:engine _event_tmp[0] run function macroengine:core/internal/events/fire_next
data remove storage macroengine:engine _event_tmp
