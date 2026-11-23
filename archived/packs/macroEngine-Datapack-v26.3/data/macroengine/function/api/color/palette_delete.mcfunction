# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/color/palette_delete [MACRO]
# Removes a color alias from the runtime palette.
#
# Input (macro args):
#   key — alias name to remove
#
# Output → none
#
# Usage:
#   function macroengine:api/color/palette_delete {key:"brand"}
execute if data storage macroengine:engine modules{color:0b} run return 0
$data remove storage macroengine:engine color.palette.$(key)
