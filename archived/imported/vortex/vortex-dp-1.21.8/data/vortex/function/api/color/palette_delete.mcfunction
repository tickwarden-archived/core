# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/color/palette_delete [MACRO]
# Removes a color alias from the runtime palette.
#
# Input (macro args):
#   key — alias name to remove
#
# Output → none
#
# Usage:
#   function vortex:api/color/palette_delete {key:"brand"}
execute if data storage vortex:engine modules{color:0b} run return 0
$data remove storage vortex:engine color.palette.$(key)
