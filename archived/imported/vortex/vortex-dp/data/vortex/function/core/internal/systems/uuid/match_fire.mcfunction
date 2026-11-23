# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ============================================================
# vortex:systems/uuid/internal/match_fire [MACRO]
# Runs the uuid/match callback.
#
# Call: function vortex:core/internal/systems/uuid/match_fire with storage vortex:input {}
# $(func) = vortex:input func field
# ============================================================
$data modify storage vortex:engine _dispatch.func set value "$(func)"
function #vortex:internal/dispatch
