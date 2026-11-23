# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/state_clear [MACRO]
$data modify storage vortex:dialog_db players.p$(id).state set value {}
