# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/refresh
function vortex:core/internal/dialog/context
function vortex:core/internal/dialog/get_view with storage vortex:dialog_ctx
execute if data storage vortex:dialog_nav target.callback run function vortex:core/internal/dialog/callback with storage vortex:dialog_nav target
