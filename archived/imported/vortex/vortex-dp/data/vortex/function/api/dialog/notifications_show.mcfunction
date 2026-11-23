# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/notifications_show
function vortex:core/internal/dialog/context
return run function vortex:core/internal/dialog/notifications_show with storage vortex:dialog_ctx
