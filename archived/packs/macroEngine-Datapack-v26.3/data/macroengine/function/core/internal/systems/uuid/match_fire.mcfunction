# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ============================================================
# macroengine:systems/uuid/internal/match_fire [MACRO]
# Runs the uuid/match callback.
#
# Call: function macroengine:core/internal/systems/uuid/match_fire with storage macroengine:input {}
# $(func) = macroengine:input func field
# ============================================================
$data modify storage macroengine:engine _dispatch.func set value "$(func)"
function #macroengine:internal/dispatch
