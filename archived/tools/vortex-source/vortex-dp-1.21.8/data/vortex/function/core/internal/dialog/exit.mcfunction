# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/exit [MACRO]
$data modify storage vortex:dialog_work dialog.exit_action set value {label:$(label),action:{type:"minecraft:run_command",command:"/trigger vortex.dialog_click set $(ticket)"}}
data modify storage vortex:dialog_work routes append from storage vortex:dialog_work route
