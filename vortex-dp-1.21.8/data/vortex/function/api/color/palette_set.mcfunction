# vortex:api/color/palette_set [MACRO]
# Registers a named color alias in the runtime palette.
# Existing key is overwritten.
#
# Input (macro args):
#   key   — alias name (e.g. "brand", "danger", "success")
#   value — color value (named or hex, e.g. "#00AAAA", "red")
#
# Output → none
#
# Usage:
#   function vortex:api/color/palette_set {key:"brand",value:"#00AAAA"}
#   function vortex:api/color/palette_set {key:"danger",value:"red"}

execute if data storage vortex:engine modules{color:0b} run return 0
execute unless data storage vortex:engine color.palette run data modify storage vortex:engine color.palette set value {}
$data modify storage vortex:engine color.palette.$(key) set value "$(value)"
