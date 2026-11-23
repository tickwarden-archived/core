# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/catalog_skip
execute unless score #skip vortex.dialog_tmp matches 1.. run return 0
data remove storage vortex:dialog_catalog queue[0]
scoreboard players remove #skip vortex.dialog_tmp 1
function vortex:core/internal/dialog/catalog_skip
