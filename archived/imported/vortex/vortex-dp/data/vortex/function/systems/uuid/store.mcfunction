# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ============================================================
# vortex:systems/uuid/store
# Caches @s entity's UUID as both string and int array
#
# USAGE:
# data modify storage vortex:input key set value "benim_anahtarim"
# execute as <entity> run function vortex:systems/uuid/store
#
# INPUT:
# vortex:input key → storage key name (e.g. "spawn_point_owner")
#
# OUTPUT (vortex:engine uuid_cache.<key>):
# .str → UUID hex string
# .arr → UUID int array [I; a, b, c, d]
#
# Not available in GU — an advanced AME-specific function.
# ============================================================

# Build UUID string → vortex:output uuid
execute if data storage vortex:engine modules{uuid:0b} run return 0
function vortex:systems/uuid/from_entity

# Also save array form (from_entity already filled _work)
data modify storage vortex:uuid _store_arr set from storage vortex:uuid _work

# Write both to cache (get key name via macro)
data modify storage vortex:uuid _store_args set value {}
data modify storage vortex:uuid _store_args.key set from storage vortex:input key
data modify storage vortex:uuid _store_args.value set from storage vortex:output uuid
function vortex:core/internal/systems/uuid/store_write with storage vortex:uuid _store_args
data remove storage vortex:uuid _store_args
