# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/auto_refresh
# Stop first: a missing/broken renderer must not loop every tick.
function vortex:api/dialog/auto_refresh_stop
tag @s add vortex.dialog_refreshing
tag @s remove vortex.dialog_refresh_done
function vortex:api/dialog/refresh
# A successful show configures the next interval. Otherwise keep the timer off.
execute unless entity @s[tag=vortex.dialog_refresh_done] run function vortex:api/dialog/auto_refresh_stop
tag @s remove vortex.dialog_refresh_done
tag @s remove vortex.dialog_refreshing
