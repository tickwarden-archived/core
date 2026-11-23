# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/color/internal/lerp_exec [MACRO]
# Internal — called by api/color/lerp.
# Reads macroengine:engine color.gradients.$(gradient)[$(step)] into output.
$data modify storage macroengine:output result set from storage macroengine:engine color.gradients.$(gradient)[$(step)]
