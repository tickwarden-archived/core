# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
execute unless data storage guikit:draw widgets[0] run return 0
data modify storage guikit:draw w set from storage guikit:draw widgets[0]
data remove storage guikit:draw widgets[0]
function guikit:internal/draw/one
function guikit:internal/draw/loop
