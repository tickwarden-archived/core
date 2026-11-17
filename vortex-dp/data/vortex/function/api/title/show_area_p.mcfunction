# vortex:api/title/show_area_p [MACRO]
# show_p for every player within `radius` blocks of the position the function runs at.
# Input (macro arg): radius. Storage input as show_p.
#
# Usage:  execute positioned 0 64 0 run function vortex:api/title/show_area_p {radius:32}
execute if data storage vortex:engine modules{title:0b} run return 0
$execute as @a[distance=..$(radius)] run function vortex:api/title/show_p
