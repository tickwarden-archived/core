# ============================================================
# vortex:systems/uuid/internal/forget_key [MACRO FUNCTION]
# Deletes the specified key from uuid_cache
#
# Call: function vortex:core/internal/systems/uuid/forget_key with storage vortex:input
# $(key) = name of the key to delete
# ============================================================
$data remove storage vortex:engine uuid_cache.$(key)
