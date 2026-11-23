# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/lib/string/concat
# Input:  vortex:input list   — list of strings to concatenate
# Output: vortex:output string.result — combined string
# Dep:    vortex:core/internal/text (in-house)
data modify storage vortex:text list set from storage vortex:input list
function vortex:core/internal/text/concat
data remove storage vortex:output string.result
execute unless data storage vortex:text err run data modify storage vortex:output string.result set from storage vortex:text out
function vortex:core/internal/text/reset
