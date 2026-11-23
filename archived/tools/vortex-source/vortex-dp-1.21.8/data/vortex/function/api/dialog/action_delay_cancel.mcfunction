# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/action_delay_cancel
function vortex:core/internal/dialog/context
return run function vortex:core/internal/dialog/delay_cancel with storage vortex:dialog_ctx
