# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/count
# INPUT vortex:text: s, needle.  RETURN number of non-overlapping occurrences.
data modify storage vortex:text n set value 0
return run function vortex:core/internal/text/find
