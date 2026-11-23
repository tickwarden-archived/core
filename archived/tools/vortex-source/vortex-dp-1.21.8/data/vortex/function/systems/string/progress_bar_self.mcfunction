# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/string/progress_bar_self [MACRO]
execute if data storage vortex:engine modules{string:0b} run return 0
$scoreboard players set $pbs_max vortex.tmp $(pb_max)
execute if score $pbs_max vortex.tmp matches ..0 run return fail

$execute store result score $pbs_seg vortex.tmp run scoreboard players get @s $(pb_obj)

scoreboard players set $pbs_ten vortex.tmp 10
scoreboard players operation $pbs_seg vortex.tmp *= $pbs_ten vortex.tmp
scoreboard players operation $pbs_seg vortex.tmp /= $pbs_max vortex.tmp

execute if score $pbs_seg vortex.tmp matches ..0 run scoreboard players set $pbs_seg vortex.tmp 0
execute if score $pbs_seg vortex.tmp matches 10.. run scoreboard players set $pbs_seg vortex.tmp 10

$execute if score $pbs_seg vortex.tmp matches 0 run title @s actionbar {"text":"$(pb_label) ░░░░░░░░░░"}
$execute if score $pbs_seg vortex.tmp matches 1 run title @s actionbar {"text":"$(pb_label) █░░░░░░░░░"}
$execute if score $pbs_seg vortex.tmp matches 2 run title @s actionbar {"text":"$(pb_label) ██░░░░░░░░"}
$execute if score $pbs_seg vortex.tmp matches 3 run title @s actionbar {"text":"$(pb_label) ███░░░░░░░"}
$execute if score $pbs_seg vortex.tmp matches 4 run title @s actionbar {"text":"$(pb_label) ████░░░░░░"}
$execute if score $pbs_seg vortex.tmp matches 5 run title @s actionbar {"text":"$(pb_label) █████░░░░░"}
$execute if score $pbs_seg vortex.tmp matches 6 run title @s actionbar {"text":"$(pb_label) ██████░░░░"}
$execute if score $pbs_seg vortex.tmp matches 7 run title @s actionbar {"text":"$(pb_label) ███████░░░"}
$execute if score $pbs_seg vortex.tmp matches 8 run title @s actionbar {"text":"$(pb_label) ████████░░"}
$execute if score $pbs_seg vortex.tmp matches 9 run title @s actionbar {"text":"$(pb_label) █████████░"}
$execute if score $pbs_seg vortex.tmp matches 10 run title @s actionbar {"text":"$(pb_label) ██████████"}
