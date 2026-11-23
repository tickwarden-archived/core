# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ============================================================
# macroengine:systems/uuid/internal/store_write [MACRO FUNCTION]
# UUID'yi macroengine:engine uuid_cache'e yazar (hem string hem array)
#
# Call: function macroengine:core/internal/systems/uuid/store_write with storage macroengine:uuid _store_args
# $(key)   = key name (from macroengine:input key, already copied by uuid/store)
# $(value) = UUID hex string (macroengine:output uuid, written by from_entity)
# ============================================================
$data modify storage macroengine:engine uuid_cache.$(key).str set value "$(value)"
$data modify storage macroengine:engine uuid_cache.$(key).arr set from storage macroengine:uuid _store_arr
