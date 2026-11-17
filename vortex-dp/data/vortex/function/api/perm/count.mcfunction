# ======================================================================================
# vortex:api/perm/count
# Counts the permissions stored for one player (api/perm/grant entries).
# Admin status (tag vortex.admin) is not a stored permission and is not counted.
#
# INPUT  (storage vortex:input perm):  player   the player name
# OUTPUT vortex:output result (int)
# RETURN the count, 0 when the player has none or the name is invalid.
#
# The name is checked with systems/validate/safe_name while it is still data, before it
# reaches a macro line (same pattern as api/perm/require).
#
# Usage:
#   data modify storage vortex:input perm.player set value "Steve"
#   function vortex:api/perm/count
# ======================================================================================

execute if data storage vortex:engine modules{perm:0b} run return 0
data modify storage vortex:output result set value 0
execute unless data storage vortex:input perm.player run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:input perm.player
execute unless function vortex:systems/validate/safe_name run return 0

function vortex:core/internal/ext/api/perm_count with storage vortex:input perm
return run data get storage vortex:output result
