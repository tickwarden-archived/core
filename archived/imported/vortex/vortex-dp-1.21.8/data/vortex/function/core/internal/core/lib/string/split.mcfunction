# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/string/split  [INTERNAL: the copy modules may call]
# Input:  vortex:input string      — original string
#         vortex:input separator   — split delimiter (default " ", ""=each char)
#         vortex:input n           — max splits (0/unset=all, +n=first n, -n=last n)
#         vortex:input keep_empty  — 1b to keep empty segments, omit/0b to strip
# Output: vortex:output string.result — list of string segments
# Dep:    vortex:core/internal/text (in-house)
# Note:   an unset separator defaults to " "
data modify storage vortex:text s set from storage vortex:input string
data modify storage vortex:text sep set value " "
data modify storage vortex:text sep set from storage vortex:input separator
data remove storage vortex:text n
data modify storage vortex:text n set from storage vortex:input n
data remove storage vortex:text keep_empty
data modify storage vortex:text keep_empty set from storage vortex:input keep_empty
function vortex:core/internal/text/split
data remove storage vortex:output string.result
data modify storage vortex:output string.result set from storage vortex:text out
function vortex:core/internal/text/reset
