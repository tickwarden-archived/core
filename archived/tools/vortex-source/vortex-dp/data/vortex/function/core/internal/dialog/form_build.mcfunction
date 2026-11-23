# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/form_build [MACRO]
$data modify storage vortex:dialog_work dialog.actions append value {label:$(label),action:{type:"minecraft:dynamic/run_command",template:"/trigger vortex.dialog_input set $(ticket)$(suffix)"}}
execute store result score #button_index vortex.dialog_tmp run data get storage vortex:dialog_work dialog.actions
scoreboard players remove #button_index vortex.dialog_tmp 1
execute store result storage vortex:dialog_work form.action_index int 1 run scoreboard players get #button_index vortex.dialog_tmp
