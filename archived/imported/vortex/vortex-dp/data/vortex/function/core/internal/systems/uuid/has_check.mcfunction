# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ============================================================
# vortex:systems/uuid/internal/has_check [MACRO FUNCTION]
# Checks key existence in the cache
#
# Call: function vortex:core/internal/systems/uuid/has_check with storage vortex:input
# $(key) = name of the key to check
# ============================================================
$execute if data storage vortex:engine uuid_cache.$(key) run scoreboard players set $uuid.has vortex.tmp 1
