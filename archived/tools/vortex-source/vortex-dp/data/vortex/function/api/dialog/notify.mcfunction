# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/notify [MACRO]
$data modify storage vortex:dialog_notification entry set value {title:$(title),body:$(body),width:$(width)}
execute store result score #notify_width vortex.dialog_tmp run data get storage vortex:dialog_notification entry.width
execute unless score #notify_width vortex.dialog_tmp matches 1..1024 run return 0
function vortex:core/internal/dialog/context
return run function vortex:core/internal/dialog/notify_enqueue with storage vortex:dialog_ctx
