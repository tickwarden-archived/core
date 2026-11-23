# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/catalog_take
execute unless score #left vortex.dialog_tmp matches 1.. run return 0
execute unless data storage vortex:dialog_catalog queue[0] run return 0
function vortex:api/dialog/button with storage vortex:dialog_catalog queue[0]
data remove storage vortex:dialog_catalog queue[0]
scoreboard players remove #left vortex.dialog_tmp 1
function vortex:core/internal/dialog/catalog_take
