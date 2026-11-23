# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ============================================================
# vortex:systems/uuid/from_entity
# Converts the current entity's (@s) UUID to a hex string
#
# USAGE:
# execute as <entity> run function vortex:systems/uuid/from_entity
#
# OUTPUT:
# vortex:output uuid → "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
#
# The result is written to vortex:output uuid. vortex:input is never touched.
# Direct NBT read on each call — always up to date
# Negative byte error is fixed (see extract_bytes)
# ============================================================

# Copy entity UUID as int[4] to working storage
execute if data storage vortex:engine modules{uuid:0b} run return 0
data modify storage vortex:uuid _work set from entity @s UUID

# Load four ints to scoreboard (without writing scores to entity)
execute store result score $uuid.0 vortex.tmp run data get storage vortex:uuid _work[0]
execute store result score $uuid.1 vortex.tmp run data get storage vortex:uuid _work[1]
execute store result score $uuid.2 vortex.tmp run data get storage vortex:uuid _work[2]
execute store result score $uuid.3 vortex.tmp run data get storage vortex:uuid _work[3]

# Split into 16 bytes → convert to hex chars → concatenate UUID string
function vortex:core/internal/systems/uuid/extract_bytes
function vortex:core/internal/systems/uuid/get_hexes with storage vortex:uuid _tmp
function vortex:core/internal/systems/uuid/concat with storage vortex:uuid _tmp
