# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/state_set [MACRO]
$data modify storage vortex:dialog_state ctx set value {key:"$(key)",value:$(value)}
function vortex:core/internal/dialog/context
data modify storage vortex:dialog_state ctx.id set from storage vortex:dialog_ctx id
function vortex:core/internal/dialog/state_set with storage vortex:dialog_state ctx
