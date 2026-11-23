# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/has
# INPUT vortex:text: s, needle.  RETURN 1 if s contains needle, else 0.
data modify storage vortex:text n set value 1
return run function vortex:core/internal/text/find
