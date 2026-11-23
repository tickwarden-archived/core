# vortex:core/internal/dialog/notifications_clear [MACRO]
$data modify storage vortex:dialog_db players.p$(id).notifications set value []
$execute if data storage vortex:dialog_db players.p$(id).frame{notification:1b} if entity @s[tag=vortex.dialog_active] run return run function vortex:core/internal/dialog/notification_finish with storage vortex:dialog_ctx
$data modify storage vortex:dialog_db players.p$(id).notify_open set value 0b
$data modify storage vortex:dialog_db players.p$(id).notify_return set value {}
