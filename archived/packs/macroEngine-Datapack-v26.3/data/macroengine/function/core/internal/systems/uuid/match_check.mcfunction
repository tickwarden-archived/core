# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ============================================================
# macroengine:systems/uuid/internal/match_check [MACRO FUNCTION]
# Dynamically compares the current UUID string with _match_target
#
# Call: function macroengine:core/internal/systems/uuid/match_check with storage macroengine:output
# $(uuid) = current UUID string written by from_entity
# ============================================================
$execute if data storage macroengine:uuid {_match_target:"$(uuid)"} run function macroengine:core/internal/systems/uuid/match_fire with storage macroengine:input
