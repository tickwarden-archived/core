# ============================================================
# vortex:systems/uuid/internal/has_check [MACRO FUNCTION]
# Checks key existence in the cache
#
# Call: function vortex:core/internal/systems/uuid/has_check with storage vortex:input
# $(key) = name of the key to check
# ============================================================
$execute if data storage vortex:engine uuid_cache.$(key) run scoreboard players set $uuid.has vortex.tmp 1
