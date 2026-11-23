# vortex:core/internal/text/has
# INPUT vortex:text: s, needle.  RETURN 1 if s contains needle, else 0.
data modify storage vortex:text n set value 1
return run function vortex:core/internal/text/find
