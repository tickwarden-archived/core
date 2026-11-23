# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/color/validate [MACRO]
# Checks whether a color string is a known named color or a valid hex code.
#
# Named colors accepted:
#   black, dark_blue, dark_green, dark_aqua, dark_red, dark_purple,
#   gold, gray, dark_gray, blue, green, aqua, red, light_purple,
#   yellow, white
#
# Hex accepted: #RRGGBB format (stored as-is; format is not verified at
# mcfunction level — caller must supply a valid string).
#
# Input (macro args):
#   color — color string to validate (e.g. "red", "#FF5500")
#
# Output → vortex:output result
#   1b = valid named color or hex-like string starting with #
#   0b = invalid / unrecognised
#
# Usage:
#   function vortex:api/color/validate {color:"red"}
#   data get storage vortex:output result
#
# Note: hex validation only checks that the value starts with "#".
# Full format validation (#RRGGBB) is not possible in mcfunction alone.

execute if data storage vortex:engine modules{color:0b} run return 0
data modify storage vortex:output result set value 0b
$data modify storage vortex:engine _color_validate_tmp set value {color:"$(color)"}
function vortex:core/internal/systems/color/validate_exec with storage vortex:engine _color_validate_tmp
