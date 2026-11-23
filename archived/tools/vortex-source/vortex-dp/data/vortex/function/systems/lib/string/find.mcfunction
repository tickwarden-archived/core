# vortex:systems/lib/string/find
# Input:  vortex:input string  — haystack string
#         vortex:input find    — substring to search
#         vortex:input n       — instance count (0=all, +n=first n, -n=last n)
# Output: vortex:output string.result — list of start indices, or [-1] if not found
# Dep:    vortex:core/internal/text (in-house)
# Note:   no match (or an empty find string) gives [-1]
data modify storage vortex:text s set from storage vortex:input string
data modify storage vortex:text needle set from storage vortex:input find
data remove storage vortex:text n
data modify storage vortex:text n set from storage vortex:input n
function vortex:core/internal/text/find
data remove storage vortex:output string.result
data modify storage vortex:output string.result set from storage vortex:text idx
execute unless data storage vortex:text idx[0] run data modify storage vortex:output string.result set value [-1]
function vortex:core/internal/text/reset
