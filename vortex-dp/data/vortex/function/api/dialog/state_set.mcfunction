# vortex:api/dialog/state_set [MACRO]
$data modify storage vortex:dialog_state ctx set value {key:"$(key)",value:$(value)}
function vortex:core/internal/dialog/context
data modify storage vortex:dialog_state ctx.id set from storage vortex:dialog_ctx id
function vortex:core/internal/dialog/state_set with storage vortex:dialog_state ctx
