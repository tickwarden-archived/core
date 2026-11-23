# ============================================================
# vortex:systems/uuid/has
# Checks whether the specified key exists in the cache
#
# EXAMPLE:
# data modify storage vortex:input key set value "my_key"
# execute if score $result vortex.tmp matches 1 ...
# function vortex:systems/uuid/has
#
# INPUT:
# vortex:input key → name of the key to check
#
# OUTPUT:
# $uuid.has vortex.tmp → 1 (found) or 0 (not found)
# ============================================================
execute if data storage vortex:engine modules{uuid:0b} run return 0
scoreboard players set $uuid.has vortex.tmp 0
function vortex:core/internal/systems/uuid/has_check with storage vortex:input
