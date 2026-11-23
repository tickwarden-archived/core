# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/after_action [MACRO]
$data modify storage vortex:dialog_layout after set value "$(value)"
scoreboard players set #after_ok vortex.dialog_tmp 0
execute if data storage vortex:dialog_layout {after:"close"} run scoreboard players set #after_ok vortex.dialog_tmp 1
execute if data storage vortex:dialog_layout {after:"none"} run scoreboard players set #after_ok vortex.dialog_tmp 1
execute if data storage vortex:dialog_layout {after:"wait_for_response"} run scoreboard players set #after_ok vortex.dialog_tmp 1
execute unless score #after_ok vortex.dialog_tmp matches 1 run return 0
execute unless data storage vortex:dialog_work dialog run return 0
data modify storage vortex:dialog_work dialog.after_action set from storage vortex:dialog_layout after
execute if data storage vortex:dialog_layout {after:"none"} run data modify storage vortex:dialog_work dialog.pause set value 0b
return 1
