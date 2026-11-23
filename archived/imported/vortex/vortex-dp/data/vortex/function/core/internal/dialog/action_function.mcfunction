# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/action_function
data modify storage vortex:dialog_action invocation set from storage vortex:dialog_action action
data modify storage vortex:dialog_action invocation.payload set from storage vortex:dialog_action payload
return run function vortex:api/dialog/native_action/function with storage vortex:dialog_action invocation
