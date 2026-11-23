# ============================================================
# vortex:systems/uuid/internal/store_write [MACRO FUNCTION]
# UUID'yi vortex:engine uuid_cache'e yazar (hem string hem array)
#
# Call: function vortex:core/internal/systems/uuid/store_write with storage vortex:uuid _store_args
# $(key)   = key name (from vortex:input key, already copied by uuid/store)
# $(value) = UUID hex string (vortex:output uuid, written by from_entity)
# ============================================================
$data modify storage vortex:engine uuid_cache.$(key).str set value "$(value)"
$data modify storage vortex:engine uuid_cache.$(key).arr set from storage vortex:uuid _store_arr
