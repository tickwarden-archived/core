# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/get/dimension [MACRO]
data remove storage macroengine:output result
$data modify storage macroengine:output result set from entity @a[name=$(player),limit=1] Dimension
