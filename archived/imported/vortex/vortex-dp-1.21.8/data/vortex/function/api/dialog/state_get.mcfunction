# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/state_get [MACRO]
$data modify storage vortex:dialog_state ctx set value {key:"$(key)"}
data modify storage vortex:dialog_state result set value {}
data modify storage vortex:dialog_state found set value 0b
function vortex:core/internal/dialog/context
data modify storage vortex:dialog_state ctx.id set from storage vortex:dialog_ctx id
return run function vortex:core/internal/dialog/state_get with storage vortex:dialog_state ctx
