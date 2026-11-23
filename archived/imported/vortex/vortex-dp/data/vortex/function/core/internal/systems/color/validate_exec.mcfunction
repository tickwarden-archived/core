# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/color/validate_exec [MACRO]
# Internal — called by api/color/validate.
# Sets vortex:output result to 1b if $(color) is a known named color,
# or if it begins with "#" (hex shorthand detection).
$execute if data storage vortex:engine color._names.$(color) run data modify storage vortex:output result set value 1b

# Hex shorthand: valid if the string is non-empty and its first character is "#".
$data modify storage vortex:engine _color_hex_probe set value "$(color)"
execute store result score #cv_hexlen vortex.tmp run data get storage vortex:engine _color_hex_probe
execute if score #cv_hexlen vortex.tmp matches 1.. run data modify storage vortex:engine _color_hex_probe set string storage vortex:engine _color_hex_probe 0 1
execute if data storage vortex:engine {_color_hex_probe:"#"} run data modify storage vortex:output result set value 1b
data remove storage vortex:engine _color_hex_probe
