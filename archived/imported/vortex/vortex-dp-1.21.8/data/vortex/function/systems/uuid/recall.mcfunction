# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ============================================================
# vortex:systems/uuid/recall
# Retrieves UUID string from the cache
#
# USAGE:
# data modify storage vortex:input key set value "benim_anahtarim"
# function vortex:systems/uuid/recall
#
# INPUT:
# vortex:input key → key name used with uuid/store
#
# OUTPUT:
# vortex:output uuid → UUID hex string
# (value unchanged if key not found)
# ============================================================
execute if data storage vortex:engine modules{uuid:0b} run return 0
function vortex:core/internal/systems/uuid/recall_read with storage vortex:input
