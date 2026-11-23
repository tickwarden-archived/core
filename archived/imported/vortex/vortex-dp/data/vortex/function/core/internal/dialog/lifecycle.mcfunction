# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/lifecycle
data remove storage vortex:dialog_event route
data remove storage vortex:dialog_event value
data remove storage vortex:dialog_event reason
function vortex:core/internal/dialog/event_context
data remove storage vortex:dialog_action action
data remove storage vortex:dialog_action index
data remove storage vortex:dialog_action result
