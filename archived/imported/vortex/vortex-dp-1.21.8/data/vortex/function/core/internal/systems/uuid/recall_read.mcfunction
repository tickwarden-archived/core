# ============================================================
# vortex:systems/uuid/internal/recall_read [MACRO FUNCTION]
# Reads UUID string from the cache
#
# Call: function vortex:core/internal/systems/uuid/recall_read with storage vortex:input
# $(key) = key name
# ============================================================
$data modify storage vortex:output uuid set from storage vortex:engine uuid_cache.$(key).str
