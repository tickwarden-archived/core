# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/commit [MACRO]
$data modify storage vortex:dialog_db players.p$(id).frame set from storage vortex:dialog_work
$data modify storage vortex:dialog_db players.p$(id).view set from storage vortex:dialog_work view
$execute if data storage vortex:dialog_work catalog.items run data modify storage vortex:dialog_db players.p$(id).catalog set from storage vortex:dialog_work catalog
