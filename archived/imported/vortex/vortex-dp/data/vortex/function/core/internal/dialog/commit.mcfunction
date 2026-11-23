# vortex:core/internal/dialog/commit [MACRO]
$data modify storage vortex:dialog_db players.p$(id).frame set from storage vortex:dialog_work
$data modify storage vortex:dialog_db players.p$(id).view set from storage vortex:dialog_work view
$execute if data storage vortex:dialog_work catalog.items run data modify storage vortex:dialog_db players.p$(id).catalog set from storage vortex:dialog_work catalog
