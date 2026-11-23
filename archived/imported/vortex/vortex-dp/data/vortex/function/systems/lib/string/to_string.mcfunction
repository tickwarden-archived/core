# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/lib/string/to_string
# Input:  vortex:input value — numeric or any SNBT value to stringify
# Output: vortex:output string.result — string representation
# Note:   Prefer 'data modify ... set string storage ...' when possible (cheaper)
# Dep:    vortex:core/internal/text (in-house)
data modify storage vortex:text in set from storage vortex:input value
function vortex:core/internal/text/to_string
data remove storage vortex:output string.result
execute unless data storage vortex:text err run data modify storage vortex:output string.result set from storage vortex:text out
function vortex:core/internal/text/reset
