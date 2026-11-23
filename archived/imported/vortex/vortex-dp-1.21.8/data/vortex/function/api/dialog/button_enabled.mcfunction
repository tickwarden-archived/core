# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/button_enabled [MACRO]
$data modify storage vortex:dialog_toggle args set value {enabled:$(enabled)}
execute unless data storage vortex:dialog_toggle args{enabled:0} unless data storage vortex:dialog_toggle args{enabled:1} run return 0
execute store result score #enabled vortex.dialog_tmp run data get storage vortex:dialog_toggle args.enabled
execute unless score #enabled vortex.dialog_tmp matches 0..1 run return 0
execute unless data storage vortex:dialog_work dialog.actions[-1] run return 0
execute store result score #button_index vortex.dialog_tmp run data get storage vortex:dialog_work dialog.actions
scoreboard players remove #button_index vortex.dialog_tmp 1
execute store result storage vortex:dialog_toggle args.index int 1 run scoreboard players get #button_index vortex.dialog_tmp
return run function vortex:core/internal/dialog/button_toggle with storage vortex:dialog_toggle args
