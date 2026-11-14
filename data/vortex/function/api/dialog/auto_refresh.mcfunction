# vortex:api/dialog/auto_refresh [MACRO]
$data modify storage vortex:dialog_refresh requested set value $(ticks)
execute store result score #refresh_ticks vortex.dialog_tmp run data get storage vortex:dialog_refresh requested
execute if score #refresh_ticks vortex.dialog_tmp matches 0 run return run function vortex:core/internal/dialog/auto_refresh_disable_draft
execute unless score #refresh_ticks vortex.dialog_tmp matches 5..1200 run return 0
execute unless data storage vortex:dialog_work view.callback run return 0
execute if data storage vortex:dialog_work dialog.inputs[0] run return 0
data modify storage vortex:dialog_work refresh set value {}
data modify storage vortex:dialog_work refresh.interval set from storage vortex:dialog_refresh requested
return 1
