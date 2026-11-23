# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/gamerule/get [MACRO]
# Reads a custom gamerule value from storage into vortex:output gamerule.
#
# INPUT (macro args via `with storage vortex:input {}`):
#   $(rule) — rule name string (must match the name used in set)
#
# OUTPUT:
#   vortex:output gamerule — the stored value string, or absent if never set
#
# EXAMPLE:
#   data modify storage vortex:input rule set value "pvp_enabled"
#   function vortex:api/gamerule/get with storage vortex:input {}
#   # read: data get storage vortex:output gamerule

# Normalize key (spaces -> underscores, lowercase). Leaves _gamerule_norm unset when
# the name cannot be normalized safely (contains a quote or a backslash).
execute if data storage vortex:engine modules{gamerule:0b} run return 0
data remove storage vortex:input _gamerule_norm
function vortex:core/internal/api/gamerule/normalize

# Read from engine storage
data remove storage vortex:output gamerule
function vortex:core/internal/api/gamerule/read with storage vortex:input {}

# $(_gamerule_norm) below is a NEW macro invocation's arg, bound at call time
# from current storage — NOT the same binding as this function's own $(rule)
# arg (which was fixed at entry, before _gamerule_norm existed). Calling this
# inline as a bare $tellraw would have silently failed to resolve.
function vortex:core/internal/api/gamerule/debug_print with storage vortex:input {}

data remove storage vortex:input _gamerule_norm
