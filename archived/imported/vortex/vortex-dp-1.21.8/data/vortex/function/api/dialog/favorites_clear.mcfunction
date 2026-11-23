# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/favorites_clear
function vortex:core/internal/dialog/context
return run function vortex:core/internal/dialog/favorites_clear with storage vortex:dialog_ctx
