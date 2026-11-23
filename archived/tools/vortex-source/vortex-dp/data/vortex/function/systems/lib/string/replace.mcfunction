# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/lib/string/replace
# Input:  vortex:input string  — original string
#         vortex:input find    — substring to replace
#         vortex:input replace — replacement string
#         vortex:input n       — instance count (0/unset=all, +n=first n, -n=last n)
# Output: vortex:output string.result — resulting string
# Dep:    vortex:core/internal/text (in-house)
# On failure (e.g. the string contains a quote or backslash) string.result is left unset.
data modify storage vortex:text s set from storage vortex:input string
data modify storage vortex:text needle set from storage vortex:input find
data modify storage vortex:text rep set from storage vortex:input replace
data remove storage vortex:text n
data modify storage vortex:text n set from storage vortex:input n
function vortex:core/internal/text/replace
data remove storage vortex:output string.result
execute unless data storage vortex:text err run data modify storage vortex:output string.result set from storage vortex:text out
function vortex:core/internal/text/reset
