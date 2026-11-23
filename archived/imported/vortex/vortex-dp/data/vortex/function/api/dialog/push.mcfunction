# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/push
function vortex:core/internal/dialog/context
function vortex:core/internal/dialog/push with storage vortex:dialog_ctx
