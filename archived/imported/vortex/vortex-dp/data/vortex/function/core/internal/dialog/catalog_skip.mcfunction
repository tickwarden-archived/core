# vortex:core/internal/dialog/catalog_skip
execute unless score #skip vortex.dialog_tmp matches 1.. run return 0
data remove storage vortex:dialog_catalog queue[0]
scoreboard players remove #skip vortex.dialog_tmp 1
function vortex:core/internal/dialog/catalog_skip
