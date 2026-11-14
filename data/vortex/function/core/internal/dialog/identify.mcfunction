# vortex:core/internal/dialog/identify
execute if score #id vortex.dialog_sys matches 2147483647 run return 0
scoreboard players add #id vortex.dialog_sys 1
scoreboard players operation @s vortex.dialog_id = #id vortex.dialog_sys
function vortex:core/internal/dialog/context
function vortex:core/internal/dialog/new_player with storage vortex:dialog_ctx
