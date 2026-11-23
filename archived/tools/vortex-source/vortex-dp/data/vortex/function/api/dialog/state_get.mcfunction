# vortex:api/dialog/state_get [MACRO]
$data modify storage vortex:dialog_state ctx set value {key:"$(key)"}
data modify storage vortex:dialog_state result set value {}
data modify storage vortex:dialog_state found set value 0b
function vortex:core/internal/dialog/context
data modify storage vortex:dialog_state ctx.id set from storage vortex:dialog_ctx id
return run function vortex:core/internal/dialog/state_get with storage vortex:dialog_state ctx
