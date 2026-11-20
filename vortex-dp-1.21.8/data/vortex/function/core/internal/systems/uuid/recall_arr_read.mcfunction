# ============================================================
# vortex:systems/uuid/internal/recall_arr_read [MACRO FUNCTION]
# Reads UUID int array from the cache
#
# Call: function vortex:core/internal/systems/uuid/recall_arr_read with storage vortex:input
# $(key) = key name
# ============================================================
$data modify storage vortex:output uuid_array set from storage vortex:engine uuid_cache.$(key).arr
