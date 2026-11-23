# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/events/fire_next
data modify storage macroengine:engine _dispatch.func set from storage macroengine:engine _event_tmp[0].func
function #macroengine:internal/dispatch
data remove storage macroengine:engine _event_tmp[0]
execute if data storage macroengine:engine _event_tmp[0] run function macroengine:core/internal/events/fire_next
