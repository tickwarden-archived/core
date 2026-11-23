# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/gamerule/reset [MACRO]
# Removes a custom gamerule from engine storage entirely.
# Does NOT touch vanilla /gamerule — this is for vortex-tracked rules only.
#
# INPUT (macro args via `with storage vortex:input {}`):
#   $(rule) — rule name string
#
# EXAMPLE:
#   data modify storage vortex:input rule set value "pvp_enabled"
#   function vortex:api/gamerule/reset with storage vortex:input {}

# Normalize key (spaces -> underscores, lowercase). Leaves _gamerule_norm unset when
# the name cannot be normalized safely (contains a quote or a backslash).
execute if data storage vortex:engine modules{gamerule:0b} run return 0
data remove storage vortex:input _gamerule_norm
function vortex:core/internal/api/gamerule/normalize

function vortex:core/internal/api/gamerule/remove with storage vortex:input {}

data remove storage vortex:input _gamerule_norm
