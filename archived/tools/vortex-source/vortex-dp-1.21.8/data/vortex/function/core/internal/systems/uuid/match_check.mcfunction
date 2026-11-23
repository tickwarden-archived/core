# ============================================================
# vortex:systems/uuid/internal/match_check [MACRO FUNCTION]
# Dynamically compares the current UUID string with _match_target
#
# Call: function vortex:core/internal/systems/uuid/match_check with storage vortex:output
# $(uuid) = current UUID string written by from_entity
# ============================================================
$execute if data storage vortex:uuid {_match_target:"$(uuid)"} run function vortex:core/internal/systems/uuid/match_fire with storage vortex:input
