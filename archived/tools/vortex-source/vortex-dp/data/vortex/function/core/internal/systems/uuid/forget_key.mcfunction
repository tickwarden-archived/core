# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ============================================================
# vortex:systems/uuid/internal/forget_key [MACRO FUNCTION]
# Deletes the specified key from uuid_cache
#
# Call: function vortex:core/internal/systems/uuid/forget_key with storage vortex:input
# $(key) = name of the key to delete
# ============================================================
$data remove storage vortex:engine uuid_cache.$(key)
