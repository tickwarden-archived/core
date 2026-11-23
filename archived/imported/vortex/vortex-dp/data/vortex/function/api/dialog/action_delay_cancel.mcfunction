# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/action_delay_cancel
function vortex:core/internal/dialog/context
return run function vortex:core/internal/dialog/delay_cancel with storage vortex:dialog_ctx
