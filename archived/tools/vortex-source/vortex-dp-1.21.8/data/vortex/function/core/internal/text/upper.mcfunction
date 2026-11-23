# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/text/upper
# INPUT  vortex:text: s    OUTPUT vortex:text: out   (or err)   RETURN 1 on success, 0 on failure
# Case mapping for ASCII letters only.
# s must not contain a quote or backslash.
data modify storage vortex:text tbl set value "upper"
return run function vortex:core/internal/text/case
