# vortex:api/dialog/state_remove [MACRO]
$data modify storage vortex:dialog_state ctx set value {key:"$(key)"}
function vortex:core/internal/dialog/context
data modify storage vortex:dialog_state ctx.id set from storage vortex:dialog_ctx id
function vortex:core/internal/dialog/state_remove with storage vortex:dialog_state ctx
