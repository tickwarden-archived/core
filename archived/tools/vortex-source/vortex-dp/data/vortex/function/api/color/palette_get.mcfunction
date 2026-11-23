# vortex:api/color/palette_get [MACRO]
# Reads a color alias from the runtime palette.
#
# Input (macro args):
#   key — alias name (e.g. "brand")
#
# Output → vortex:output result
#   The stored color value, or absent if key not found.
#
# Usage:
#   function vortex:api/color/palette_get {key:"brand"}
#   data get storage vortex:output result

execute if data storage vortex:engine modules{color:0b} run return 0
data modify storage vortex:output result set value ""
$execute if data storage vortex:engine color.palette.$(key) run data modify storage vortex:output result set from storage vortex:engine color.palette.$(key)
