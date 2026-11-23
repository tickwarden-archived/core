# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/notify_enqueue [MACRO]
$execute unless data storage vortex:dialog_db players.p$(id).notifications run data modify storage vortex:dialog_db players.p$(id).notifications set value []
$execute store result score #notify_count vortex.dialog_tmp run data get storage vortex:dialog_db players.p$(id).notifications
execute if score #notify_count vortex.dialog_tmp matches 32.. run return 0
$data modify storage vortex:dialog_db players.p$(id).notifications append from storage vortex:dialog_notification entry
return 1
