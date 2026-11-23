# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ============================================================
# vortex:systems/uuid/recall_array
# Retrieves UUID int array from the cache
#
# USAGE:
# data modify storage vortex:input key set value "benim_anahtarim"
# function vortex:systems/uuid/recall_array
#
# INPUT:
# vortex:input key → key name used with uuid/store
#
# OUTPUT:
# vortex:output uuid_array → UUID int array [I; a, b, c, d]
# (value unchanged if key not found)
#
# Use case: writing UUID to entity NBT (e.g. Owner field)
# ============================================================
execute if data storage vortex:engine modules{uuid:0b} run return 0
function vortex:core/internal/systems/uuid/recall_arr_read with storage vortex:input
