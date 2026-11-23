# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/button [MACRO]
$data modify storage vortex:dialog_work dialog.actions append value {label:$(label),width:150,action:{type:"minecraft:run_command",command:"/trigger vortex.dialog_click set $(ticket)"}}
execute if data storage vortex:dialog_work theme.button run data modify storage vortex:dialog_work dialog.actions[-1].label merge from storage vortex:dialog_work theme.button
execute if data storage vortex:dialog_work theme.button_width run data modify storage vortex:dialog_work dialog.actions[-1].width set from storage vortex:dialog_work theme.button_width
execute store result score #button_index vortex.dialog_tmp run data get storage vortex:dialog_work dialog.actions
scoreboard players remove #button_index vortex.dialog_tmp 1
execute store result storage vortex:dialog_work route.action_index int 1 run scoreboard players get #button_index vortex.dialog_tmp
data modify storage vortex:dialog_work routes append from storage vortex:dialog_work route
