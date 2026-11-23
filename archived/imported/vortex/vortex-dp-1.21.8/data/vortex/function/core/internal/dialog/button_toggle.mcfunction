# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/button_toggle [MACRO]
$execute if data storage vortex:dialog_work disabled_last{index:$(index)} if score #enabled vortex.dialog_tmp matches 1 run data modify storage vortex:dialog_work dialog.actions[-1].action set from storage vortex:dialog_work disabled_last.action
$execute if data storage vortex:dialog_work disabled_last{index:$(index)} if score #enabled vortex.dialog_tmp matches 1 run data remove storage vortex:dialog_work disabled_last
execute if score #enabled vortex.dialog_tmp matches 1 run return run function vortex:core/internal/dialog/button_route_enable with storage vortex:dialog_toggle args
$execute unless data storage vortex:dialog_work disabled_last{index:$(index)} run data modify storage vortex:dialog_work disabled_last set value {index:$(index)}
execute if data storage vortex:dialog_work dialog.actions[-1].action run data modify storage vortex:dialog_work disabled_last.action set from storage vortex:dialog_work dialog.actions[-1].action
data remove storage vortex:dialog_work dialog.actions[-1].action
return run function vortex:core/internal/dialog/button_route_enable with storage vortex:dialog_toggle args
