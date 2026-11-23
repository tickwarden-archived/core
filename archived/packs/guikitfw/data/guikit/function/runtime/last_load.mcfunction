# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(pid)
$data modify storage guikit:work menu set from storage guikit:mem last.p$(pid)
