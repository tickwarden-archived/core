# vortex:api/dialog/columns [MACRO]
$data modify storage vortex:dialog_layout args set value {columns:$(columns)}
execute store result score #columns vortex.dialog_tmp run data get storage vortex:dialog_layout args.columns
execute unless score #columns vortex.dialog_tmp matches 1..8 run return 0
execute store result storage vortex:dialog_layout check int 1 run scoreboard players get #columns vortex.dialog_tmp
execute store result score #columns_type vortex.dialog_tmp run data modify storage vortex:dialog_layout check set from storage vortex:dialog_layout args.columns
execute if score #columns_type vortex.dialog_tmp matches 1 run return 0
execute unless data storage vortex:dialog_work dialog{type:"minecraft:multi_action"} run return 0
data modify storage vortex:dialog_work dialog.columns set from storage vortex:dialog_layout args.columns
return 1
