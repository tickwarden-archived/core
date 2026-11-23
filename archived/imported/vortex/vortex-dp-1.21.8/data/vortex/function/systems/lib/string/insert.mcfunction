# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/lib/string/insert
# Input:  vortex:input string    — original string
#         vortex:input insertion — string to insert
#         vortex:input index     — insertion position (integer)
# Output: vortex:output string.result — resulting string
# Dep:    vortex:core/internal/text (in-house)
# On failure (e.g. the string contains a quote or backslash) string.result is left unset.
data modify storage vortex:text s set from storage vortex:input string
data modify storage vortex:text ins set from storage vortex:input insertion
data modify storage vortex:text at set from storage vortex:input index
function vortex:core/internal/text/insert
data remove storage vortex:output string.result
execute unless data storage vortex:text err run data modify storage vortex:output string.result set from storage vortex:text out
function vortex:core/internal/text/reset
