# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/notification_next [MACRO]
$execute unless data storage vortex:dialog_db players.p$(id).frame{notification:1b} run return 0
$data remove storage vortex:dialog_db players.p$(id).notifications[0]
$execute if data storage vortex:dialog_db players.p$(id).notifications[0] run return run function vortex:core/internal/dialog/notifications_show with storage vortex:dialog_ctx
function vortex:core/internal/dialog/notification_finish with storage vortex:dialog_ctx
