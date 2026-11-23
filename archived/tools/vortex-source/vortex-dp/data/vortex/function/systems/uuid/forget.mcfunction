# ============================================================
# vortex:systems/uuid/forget
# Deletes a UUID entry from the cache
#
# USAGE:
# data modify storage vortex:input key set value "benim_anahtarim"
# function vortex:systems/uuid/forget
#
# INPUT:
# vortex:input key → name of the key to delete
# ============================================================
execute if data storage vortex:engine modules{uuid:0b} run return 0
function vortex:core/internal/systems/uuid/forget_key with storage vortex:input
