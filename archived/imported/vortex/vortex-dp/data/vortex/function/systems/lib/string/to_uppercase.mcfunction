# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/lib/string/to_uppercase
# Fast variant — covers a-z only (faster)
# Input:  vortex:input string — string to convert
# Output: vortex:output string.result — uppercase string
# Dep:    vortex:core/internal/text (in-house)
# On failure (e.g. the string contains a quote or backslash) string.result is left unset.
data modify storage vortex:text s set from storage vortex:input string
function vortex:core/internal/text/upper
data remove storage vortex:output string.result
execute unless data storage vortex:text err run data modify storage vortex:output string.result set from storage vortex:text out
function vortex:core/internal/text/reset
