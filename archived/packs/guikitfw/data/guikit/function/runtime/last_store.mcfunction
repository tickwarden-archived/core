# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(pid) $(menu)
$data modify storage guikit:mem last.p$(pid) set value "$(menu)"
