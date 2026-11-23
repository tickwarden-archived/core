# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ============================================================
# vortex:systems/uuid/match
# Compares @s entity's UUID with vortex:input value
# If matched, runs vortex:input func function
#
# USAGE:
# data modify storage vortex:input value set value "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
# data modify storage vortex:input func set value "mynamespace:my_function"
# execute as <entity> run function vortex:systems/uuid/match
#
# INPUT:
# vortex:input value → UUID string to compare (expected)
# vortex:input func → function to run if matched
#
# NOTE: func is run in the same entity context.
# ============================================================

# Save expected UUID string to temporary field
# (kept as a copy so the check below is independent of the input storage)
execute if data storage vortex:engine modules{uuid:0b} run return 0
data modify storage vortex:uuid _match_target set from storage vortex:input value

# Convert @s UUID to string → vortex:output uuid
function vortex:systems/uuid/from_entity

# Compare: if matched, run func
# Is the current UUID (vortex:output uuid) equal to the expected?
function vortex:core/internal/systems/uuid/match_check with storage vortex:output
