# vortex:api/dialog/action/run_command [MACRO]
$data modify storage vortex:dialog_work dialog.actions append value {label:$(label),width:150,action:{type:"minecraft:run_command",command:"$(cmd)"}}
return 1
