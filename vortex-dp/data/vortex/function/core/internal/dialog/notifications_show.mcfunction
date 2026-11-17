# vortex:core/internal/dialog/notifications_show [MACRO]
$execute unless data storage vortex:dialog_db players.p$(id).notifications[0] run return 0
$execute unless data storage vortex:dialog_db players.p$(id){notify_open:1b} run data modify storage vortex:dialog_db players.p$(id).notify_return set from storage vortex:dialog_db players.p$(id).view
$data modify storage vortex:dialog_db players.p$(id).notify_open set value 1b
$data modify storage vortex:dialog_notification current set from storage vortex:dialog_db players.p$(id).notifications[0]
function vortex:core/internal/dialog/notification_render with storage vortex:dialog_notification current
return 1
