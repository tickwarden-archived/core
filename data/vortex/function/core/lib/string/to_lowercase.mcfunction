# vortex:core/lib/string/to_lowercase
# Fast variant — covers A-Z only (faster)
# Input:  vortex:input string — string to convert
# Output: vortex:output string.result — lowercase string
# Dep:    vortex:core/internal/text (in-house)
# On failure (e.g. the string contains a quote or backslash) string.result is left unset.
data modify storage vortex:text s set from storage vortex:input string
function vortex:core/internal/text/lower
data remove storage vortex:output string.result
execute unless data storage vortex:text err run data modify storage vortex:output string.result set from storage vortex:text out
function vortex:core/internal/text/reset
