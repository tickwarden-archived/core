# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/color/gradient_delete [MACRO]
# Removes a named gradient from storage.
#
# Input (macro args):
#   name — gradient name to remove
#
# Usage:
#   function vortex:api/color/gradient_delete {name:"health"}
execute if data storage vortex:engine modules{color:0b} run return 0
$data remove storage vortex:engine color.gradients.$(name)
