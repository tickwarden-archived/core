# vortex:core/internal/systems/color/lerp_exec [MACRO]
# Internal — called by api/color/lerp.
# Reads vortex:engine color.gradients.$(gradient)[$(step)] into output.
$data modify storage vortex:output result set from storage vortex:engine color.gradients.$(gradient)[$(step)]
