# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
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
