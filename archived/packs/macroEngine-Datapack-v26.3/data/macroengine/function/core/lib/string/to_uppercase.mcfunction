# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/lib/string/to_uppercase
# Fast variant — covers a-z only (faster)
# Input:  macroengine:input string — string to convert
# Output: macroengine:output string.result — uppercase string
# Dep:    macroengine:core/internal/text (in-house)
# On failure (e.g. the string contains a quote or backslash) string.result is left unset.
data modify storage macroengine:text s set from storage macroengine:input string
function macroengine:core/internal/text/upper
data remove storage macroengine:output string.result
execute unless data storage macroengine:text err run data modify storage macroengine:output string.result set from storage macroengine:text out
function macroengine:core/internal/text/reset
