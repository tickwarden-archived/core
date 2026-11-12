# vortex:systems/color/internal/resolve_exec [MACRO]
# Called with storage vortex:engine color {} — reads palette.$(color).
# If the key exists in palette, copies it to vortex:output result.
# Uses the outer $(color) macro arg captured by api/color/resolve.
# NOTE: This file is called with `with storage vortex:engine color {}`
# so macro args come from the color compound (which contains "palette").
# The $(color) arg is forwarded from the parent macro frame.
$execute if data storage vortex:engine color.palette.$(color) run data modify storage vortex:output result set from storage vortex:engine color.palette.$(color)
