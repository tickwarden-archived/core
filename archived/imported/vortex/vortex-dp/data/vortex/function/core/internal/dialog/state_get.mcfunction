# vortex:core/internal/dialog/state_get [MACRO]
$execute unless data storage vortex:dialog_db players.p$(id).state.$(key) run return 0
data modify storage vortex:dialog_state found set value 1b
$data modify storage vortex:dialog_state result set from storage vortex:dialog_db players.p$(id).state.$(key)
return 1
