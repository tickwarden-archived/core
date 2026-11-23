# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/text/_cut [MACRO]
# INPUT $(a) $(b): win = substring [a, b) of storage vortex:text s. Bounds must be valid.
$data modify storage vortex:text win set string storage vortex:text s $(a) $(b)
