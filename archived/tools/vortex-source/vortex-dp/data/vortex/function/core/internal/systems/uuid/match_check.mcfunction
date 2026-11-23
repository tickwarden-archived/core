# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ============================================================
# vortex:systems/uuid/internal/match_check [MACRO FUNCTION]
# Dynamically compares the current UUID string with _match_target
#
# Call: function vortex:core/internal/systems/uuid/match_check with storage vortex:output
# $(uuid) = current UUID string written by from_entity
# ============================================================
$execute if data storage vortex:uuid {_match_target:"$(uuid)"} run function vortex:core/internal/systems/uuid/match_fire with storage vortex:input
