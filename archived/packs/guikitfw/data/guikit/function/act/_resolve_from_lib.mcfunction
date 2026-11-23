# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
data modify storage guikit:work id set from storage guikit:ctx menu
function guikit:internal/draw/load_menu with storage guikit:work
execute store result storage guikit:work page int 1 run scoreboard players get @s guikit.page
function guikit:internal/draw/load_page with storage guikit:work
data modify storage guikit:work queue set from storage guikit:draw widgets
