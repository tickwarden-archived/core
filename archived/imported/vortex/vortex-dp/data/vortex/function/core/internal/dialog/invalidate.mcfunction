# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/invalidate
tag @s remove vortex.dialog_active
tag @s remove vortex.dialog_form
scoreboard players reset @s vortex.dialog_click
scoreboard players reset @s vortex.dialog_input
function vortex:api/dialog/auto_refresh_stop
