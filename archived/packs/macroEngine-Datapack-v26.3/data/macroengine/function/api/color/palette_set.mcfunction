# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/color/palette_set [MACRO]
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
#   function macroengine:api/color/palette_set {key:"brand",value:"#00AAAA"}
#   function macroengine:api/color/palette_set {key:"danger",value:"red"}

execute if data storage macroengine:engine modules{color:0b} run return 0
execute unless data storage macroengine:engine color.palette run data modify storage macroengine:engine color.palette set value {}
$data modify storage macroengine:engine color.palette.$(key) set value "$(value)"
