# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ============================================================
# macroengine:systems/uuid/internal/forget_key [MACRO FUNCTION]
# Deletes the specified key from uuid_cache
#
# Call: function macroengine:core/internal/systems/uuid/forget_key with storage macroengine:input
# $(key) = name of the key to delete
# ============================================================
$data remove storage macroengine:engine uuid_cache.$(key)
