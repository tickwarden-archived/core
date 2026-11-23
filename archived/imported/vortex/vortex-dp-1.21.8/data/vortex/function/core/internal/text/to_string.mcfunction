# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/to_string
# INPUT  vortex:text: in (any value)    OUTPUT vortex:text: out (string)   or err
# RETURN 1 on success, 0 on failure.
data remove storage vortex:text err
data remove storage vortex:text out
execute unless data storage vortex:text in run data modify storage vortex:text err set value "to_string: no input"
execute unless data storage vortex:text in run return 0
data modify storage vortex:text out set string storage vortex:text in
return 1
