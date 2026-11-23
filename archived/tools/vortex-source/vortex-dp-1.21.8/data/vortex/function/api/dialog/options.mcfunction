# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/options [MACRO]
$data modify storage vortex:dialog_layout escape set value $(escape)
scoreboard players set #escape_valid vortex.dialog_tmp 0
execute if data storage vortex:dialog_layout {escape:0} run scoreboard players set #escape_valid vortex.dialog_tmp 1
execute if data storage vortex:dialog_layout {escape:1} run scoreboard players set #escape_valid vortex.dialog_tmp 1
execute unless score #escape_valid vortex.dialog_tmp matches 1 run return 0
$execute store result score #columns_ok vortex.dialog_tmp run function vortex:api/dialog/columns {columns:$(columns)}
execute unless score #columns_ok vortex.dialog_tmp matches 1 run return 0
execute store result score #escape vortex.dialog_tmp run data get storage vortex:dialog_layout escape
execute store result storage vortex:dialog_work dialog.can_close_with_escape byte 1 run scoreboard players get #escape vortex.dialog_tmp
return 1
