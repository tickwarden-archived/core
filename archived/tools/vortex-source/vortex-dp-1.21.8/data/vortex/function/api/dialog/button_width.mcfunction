# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/button_width [MACRO]
# Resize the most recently appended action button; call before show/notice/confirmation.
$data modify storage vortex:dialog_width args set value {width:$(width)}
execute store result score #width vortex.dialog_tmp run data get storage vortex:dialog_width args.width
execute unless score #width vortex.dialog_tmp matches 1..1024 run return 0
execute store result storage vortex:dialog_width check.width int 1 run scoreboard players get #width vortex.dialog_tmp
execute store result score #width_type vortex.dialog_tmp run data modify storage vortex:dialog_width check.width set from storage vortex:dialog_width args.width
execute if score #width_type vortex.dialog_tmp matches 1 run return 0
execute unless data storage vortex:dialog_work dialog.actions[-1] run return 0
data modify storage vortex:dialog_work dialog.actions[-1].width set from storage vortex:dialog_width args.width
return 1
