# vortex:systems/string/progress_bar [MACRO]
execute if data storage vortex:engine modules{string:0b} run return 0
$scoreboard players set $pb1_seg vortex.tmp $(current)
$scoreboard players set $pb1_max vortex.tmp $(max)

execute if score $pb1_max vortex.tmp matches ..0 run return fail

scoreboard players set $pb1_ten vortex.tmp 10
scoreboard players operation $pb1_seg vortex.tmp *= $pb1_ten vortex.tmp
scoreboard players operation $pb1_seg vortex.tmp /= $pb1_max vortex.tmp

execute if score $pb1_seg vortex.tmp matches ..0 run scoreboard players set $pb1_seg vortex.tmp 0
execute if score $pb1_seg vortex.tmp matches 10.. run scoreboard players set $pb1_seg vortex.tmp 10

$execute if score $pb1_seg vortex.tmp matches 0 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) ░░░░░░░░░░"}
$execute if score $pb1_seg vortex.tmp matches 1 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) █░░░░░░░░░"}
$execute if score $pb1_seg vortex.tmp matches 2 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) ██░░░░░░░░"}
$execute if score $pb1_seg vortex.tmp matches 3 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) ███░░░░░░░"}
$execute if score $pb1_seg vortex.tmp matches 4 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) ████░░░░░░"}
$execute if score $pb1_seg vortex.tmp matches 5 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) █████░░░░░"}
$execute if score $pb1_seg vortex.tmp matches 6 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) ██████░░░░"}
$execute if score $pb1_seg vortex.tmp matches 7 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) ███████░░░"}
$execute if score $pb1_seg vortex.tmp matches 8 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) ████████░░"}
$execute if score $pb1_seg vortex.tmp matches 9 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) █████████░"}
$execute if score $pb1_seg vortex.tmp matches 10 run title @a[name=$(player),limit=1] actionbar {"text":"$(label) ██████████"}
