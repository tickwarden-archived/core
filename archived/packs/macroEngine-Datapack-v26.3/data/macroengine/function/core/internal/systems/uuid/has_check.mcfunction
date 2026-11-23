# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ============================================================
# macroengine:systems/uuid/internal/has_check [MACRO FUNCTION]
# Checks key existence in the cache
#
# Call: function macroengine:core/internal/systems/uuid/has_check with storage macroengine:input
# $(key) = name of the key to check
# ============================================================
$execute if data storage macroengine:engine uuid_cache.$(key) run scoreboard players set $uuid.has macroengine.tmp 1
