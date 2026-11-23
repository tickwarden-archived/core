# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/player/get/dimension [MACRO]
data remove storage vortex:output result
$data modify storage vortex:output result set from entity @a[name=$(player),limit=1] Dimension
