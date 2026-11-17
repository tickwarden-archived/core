# vortex:core/internal/dialog/power_ten
execute unless score #digits vortex.dialog_tmp matches 1.. run return 0
scoreboard players operation #factor vortex.dialog_tmp *= #ten vortex.dialog_sys
scoreboard players remove #digits vortex.dialog_tmp 1
function vortex:core/internal/dialog/power_ten
