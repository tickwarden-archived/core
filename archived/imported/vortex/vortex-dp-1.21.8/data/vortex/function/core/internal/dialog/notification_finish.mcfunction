# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/notification_finish [MACRO]
$data modify storage vortex:dialog_notification resume set from storage vortex:dialog_db players.p$(id).notify_return
$data modify storage vortex:dialog_db players.p$(id).notify_return set value {}
$data modify storage vortex:dialog_db players.p$(id).notify_open set value 0b
function vortex:api/dialog/close
execute if data storage vortex:dialog_notification resume.callback run function vortex:core/internal/dialog/callback with storage vortex:dialog_notification resume
