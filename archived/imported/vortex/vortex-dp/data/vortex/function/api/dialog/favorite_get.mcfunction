# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/favorite_get [MACRO]
$data modify storage vortex:dialog_favorites args set value {key:"$(key)"}
function vortex:core/internal/dialog/context
data modify storage vortex:dialog_favorites args.id set from storage vortex:dialog_ctx id
return run function vortex:core/internal/dialog/favorite_get with storage vortex:dialog_favorites args
