# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/color/resolve [MACRO]
# Looks up a named palette entry or returns the value as-is if not found.
# Use this to map short alias keys (e.g. "brand", "danger", "info") to hex.
#
# The palette is stored in vortex:engine color.palette as a compound:
#   {brand:"#00AAAA", danger:"red", info:"aqua", ...}
# Populate via vortex:api/color/palette_set.
#
# Input (macro args):
#   color — alias key or direct color value
#
# Output → vortex:output result
#   The resolved color string (palette value if key found; input value otherwise).
#
# Usage:
#   function vortex:api/color/resolve {color:"brand"}
#   # → vortex:output result = "#00AAAA"  (if palette has brand→#00AAAA)
#
#   function vortex:api/color/resolve {color:"red"}
#   # → vortex:output result = "red"  (not in palette, returned as-is)

# Default: return input value
execute if data storage vortex:engine modules{color:0b} run return 0
$data modify storage vortex:output result set value "$(color)"

# Override if palette has this key — write color key into temp so resolve_exec can access it
$data modify storage vortex:engine _color_resolve_tmp set value {color:"$(color)"}
execute if data storage vortex:engine color.palette run function vortex:core/internal/systems/color/resolve_exec with storage vortex:engine _color_resolve_tmp
data remove storage vortex:engine _color_resolve_tmp
