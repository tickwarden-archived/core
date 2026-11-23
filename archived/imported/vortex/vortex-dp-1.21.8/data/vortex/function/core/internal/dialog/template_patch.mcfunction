# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/template_patch [MACRO]
$execute if data storage vortex:dialog_work dialog.actions[{action:{command:"/trigger vortex.dialog_click set $(old)"}}] run data modify storage vortex:dialog_work dialog.actions[{action:{command:"/trigger vortex.dialog_click set $(old)"}}].action.command set value "/trigger vortex.dialog_click set $(new)"
$execute if data storage vortex:dialog_work dialog.exit_action{action:{command:"/trigger vortex.dialog_click set $(old)"}} run data modify storage vortex:dialog_work dialog.exit_action.action.command set value "/trigger vortex.dialog_click set $(new)"
$execute if data storage vortex:dialog_work dialog.action{action:{command:"/trigger vortex.dialog_click set $(old)"}} run data modify storage vortex:dialog_work dialog.action.action.command set value "/trigger vortex.dialog_click set $(new)"
$execute if data storage vortex:dialog_work dialog.yes{action:{command:"/trigger vortex.dialog_click set $(old)"}} run data modify storage vortex:dialog_work dialog.yes.action.command set value "/trigger vortex.dialog_click set $(new)"
$execute if data storage vortex:dialog_work dialog.no{action:{command:"/trigger vortex.dialog_click set $(old)"}} run data modify storage vortex:dialog_work dialog.no.action.command set value "/trigger vortex.dialog_click set $(new)"
$execute if data storage vortex:dialog_work disabled_last.action{command:"/trigger vortex.dialog_click set $(old)"} run data modify storage vortex:dialog_work disabled_last.action.command set value "/trigger vortex.dialog_click set $(new)"
