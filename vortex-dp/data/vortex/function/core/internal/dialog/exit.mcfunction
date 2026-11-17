# vortex:core/internal/dialog/exit [MACRO]
$data modify storage vortex:dialog_work dialog.exit_action set value {label:$(label),action:{type:"minecraft:run_command",command:"/trigger vortex.dialog_click set $(ticket)"}}
data modify storage vortex:dialog_work routes append from storage vortex:dialog_work route
