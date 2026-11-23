# vortex:api/dialog/favorite_remove [MACRO]
$data modify storage vortex:dialog_favorites args set value {key:"$(key)"}
function vortex:core/internal/dialog/context
data modify storage vortex:dialog_favorites args.id set from storage vortex:dialog_ctx id
return run function vortex:core/internal/dialog/favorite_remove with storage vortex:dialog_favorites args
