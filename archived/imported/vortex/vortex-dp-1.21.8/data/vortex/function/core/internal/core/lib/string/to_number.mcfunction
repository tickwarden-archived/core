# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/string/to_number
# Input:  vortex:input string — numeric string (e.g. "42" or "3.14")
# Output: vortex:output string.result — numeric NBT value
# Dep:    vortex:core/internal/text (in-house)
# On failure (e.g. the string contains a quote or backslash) string.result is left unset.
data modify storage vortex:text s set from storage vortex:input string
function vortex:core/internal/text/to_number
data remove storage vortex:output string.result
execute unless data storage vortex:text err run data modify storage vortex:output string.result set from storage vortex:text out
function vortex:core/internal/text/reset
