# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/push [MACRO]
execute store result score #depth vortex.dialog_tmp run data get storage vortex:dialog_db players.p$(id).history
execute if score #depth vortex.dialog_tmp matches 16.. run return 0
$execute unless data storage vortex:dialog_db players.p$(id).view.callback run return 0
$data modify storage vortex:dialog_nav entry set from storage vortex:dialog_db players.p$(id).view
$data modify storage vortex:dialog_nav entry.catalog set from storage vortex:dialog_db players.p$(id).catalog
$data modify storage vortex:dialog_db players.p$(id).history append from storage vortex:dialog_nav entry
