# vortex:core/internal/dialog/catalog_take
execute unless score #left vortex.dialog_tmp matches 1.. run return 0
execute unless data storage vortex:dialog_catalog queue[0] run return 0
function vortex:api/dialog/button with storage vortex:dialog_catalog queue[0]
data remove storage vortex:dialog_catalog queue[0]
scoreboard players remove #left vortex.dialog_tmp 1
function vortex:core/internal/dialog/catalog_take
