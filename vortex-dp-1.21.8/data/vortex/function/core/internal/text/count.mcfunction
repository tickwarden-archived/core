# vortex:core/internal/text/count
# INPUT vortex:text: s, needle.  RETURN number of non-overlapping occurrences.
data modify storage vortex:text n set value 0
return run function vortex:core/internal/text/find
