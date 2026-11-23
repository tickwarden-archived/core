# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ============================================================
# vortex:systems/uuid/from_array
# Converts int array in vortex:input value to UUID string
#
# USAGE:
# data modify storage vortex:input value set value [I; a, b, c, d]
# function vortex:systems/uuid/from_array
#
# INPUT:
# vortex:input value → [I; int0, int1, int2, int3]
#
# OUTPUT:
# vortex:output uuid → "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
#
# The input array in vortex:input value is left as it was.
# ============================================================

# Read int[4] array directly from vortex:input value
execute if data storage vortex:engine modules{uuid:0b} run return 0
execute store result score $uuid.0 vortex.tmp run data get storage vortex:input value[0]
execute store result score $uuid.1 vortex.tmp run data get storage vortex:input value[1]
execute store result score $uuid.2 vortex.tmp run data get storage vortex:input value[2]
execute store result score $uuid.3 vortex.tmp run data get storage vortex:input value[3]

# Split into 16 bytes → convert to hex chars → concatenate UUID string
function vortex:core/internal/systems/uuid/extract_bytes
function vortex:core/internal/systems/uuid/get_hexes with storage vortex:uuid _tmp
function vortex:core/internal/systems/uuid/concat with storage vortex:uuid _tmp
