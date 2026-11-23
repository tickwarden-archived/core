# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/back
function vortex:core/internal/dialog/context
data remove storage vortex:dialog_nav target
function vortex:core/internal/dialog/pop with storage vortex:dialog_ctx
execute unless data storage vortex:dialog_nav target.callback run return run function vortex:api/dialog/close
function vortex:core/internal/dialog/callback with storage vortex:dialog_nav target
