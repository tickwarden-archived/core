# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/form_code [MACRO]
# Fixed-width decimal pattern from trusted developer; 1..6 digits. inputs must output digits.
$data modify storage vortex:dialog_work route set value {label:$(label),callback:$(callback),payload:$(payload),min:$(min),max:$(max),digits:$(digits),suffix:"$(pattern)"}
execute store result score #digits vortex.dialog_tmp run data get storage vortex:dialog_work route.digits
execute unless score #digits vortex.dialog_tmp matches 1..6 run return 0
scoreboard players set #factor vortex.dialog_tmp 1
function vortex:core/internal/dialog/power_ten
execute store result storage vortex:dialog_work route.factor int 1 run scoreboard players get #factor vortex.dialog_tmp
execute store result score #min vortex.dialog_tmp run data get storage vortex:dialog_work route.min
execute store result score #max vortex.dialog_tmp run data get storage vortex:dialog_work route.max
execute unless score #min vortex.dialog_tmp matches 0.. run return 0
execute if score #max vortex.dialog_tmp >= #factor vortex.dialog_tmp run return 0
execute if score #min vortex.dialog_tmp > #max vortex.dialog_tmp run return 0
scoreboard players set #limit vortex.dialog_tmp 2147483647
scoreboard players operation #limit vortex.dialog_tmp /= #factor vortex.dialog_tmp
scoreboard players remove #limit vortex.dialog_tmp 1
execute if score #ticket vortex.dialog_sys >= #limit vortex.dialog_tmp run return 0
execute store result score #ok vortex.dialog_tmp run function vortex:core/internal/dialog/ticket
execute unless score #ok vortex.dialog_tmp matches 1 run return 0
data modify storage vortex:dialog_work form set from storage vortex:dialog_work route
function vortex:core/internal/dialog/form_build with storage vortex:dialog_work form
