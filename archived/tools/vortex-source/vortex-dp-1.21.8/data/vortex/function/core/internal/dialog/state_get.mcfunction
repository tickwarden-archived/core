# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/state_get [MACRO]
$execute unless data storage vortex:dialog_db players.p$(id).state.$(key) run return 0
data modify storage vortex:dialog_state found set value 1b
$data modify storage vortex:dialog_state result set from storage vortex:dialog_db players.p$(id).state.$(key)
return 1
