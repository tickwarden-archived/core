# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ============================================================
# macroengine:systems/uuid/internal/recall_arr_read [MACRO FUNCTION]
# Reads UUID int array from the cache
#
# Call: function macroengine:core/internal/systems/uuid/recall_arr_read with storage macroengine:input
# $(key) = key name
# ============================================================
$data modify storage macroengine:output uuid_array set from storage macroengine:engine uuid_cache.$(key).arr
