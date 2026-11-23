# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/color/lerp_exec [MACRO]
# Internal — called by api/color/lerp.
# Reads vortex:engine color.gradients.$(gradient)[$(step)] into output.
$data modify storage vortex:output result set from storage vortex:engine color.gradients.$(gradient)[$(step)]
