# vortex:core/internal/dialog/invalidate
tag @s remove vortex.dialog_active
tag @s remove vortex.dialog_form
scoreboard players reset @s vortex.dialog_click
scoreboard players reset @s vortex.dialog_input
function vortex:api/dialog/auto_refresh_stop
