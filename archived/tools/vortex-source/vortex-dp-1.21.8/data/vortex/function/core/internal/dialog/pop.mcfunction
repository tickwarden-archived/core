# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/pop [MACRO]
$data modify storage vortex:dialog_nav target set from storage vortex:dialog_db players.p$(id).history[-1]
$data remove storage vortex:dialog_db players.p$(id).history[-1]
$execute if data storage vortex:dialog_nav target.catalog.items run data modify storage vortex:dialog_db players.p$(id).catalog set from storage vortex:dialog_nav target.catalog
