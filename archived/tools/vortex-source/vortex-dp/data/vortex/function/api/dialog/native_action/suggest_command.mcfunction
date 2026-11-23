# vortex:api/dialog/native_action/suggest_command [MACRO]
# Native client button action. No server callback ticket is allocated.
$data modify storage vortex:dialog_work dialog.actions append value {label:$(label),width:150,action:{type:"minecraft:suggest_command",command:"$(command)"}}
execute if data storage vortex:dialog_work theme.button run data modify storage vortex:dialog_work dialog.actions[-1].label merge from storage vortex:dialog_work theme.button
execute if data storage vortex:dialog_work theme.button_width run data modify storage vortex:dialog_work dialog.actions[-1].width set from storage vortex:dialog_work theme.button_width
return 1
