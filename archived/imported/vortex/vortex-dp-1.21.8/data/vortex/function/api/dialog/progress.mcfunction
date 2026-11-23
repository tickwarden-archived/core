# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/progress [MACRO]
# value is clamped to 0..max; max is limited to avoid signed score overflow.
$data modify storage vortex:dialog_progress input set value {label:$(label),value:$(value),max:$(max)}
execute store result score #bar_max vortex.dialog_tmp run data get storage vortex:dialog_progress input.max
execute unless score #bar_max vortex.dialog_tmp matches 1..1000000 run return 0
execute store result score #bar_value vortex.dialog_tmp run data get storage vortex:dialog_progress input.value
execute if score #bar_value vortex.dialog_tmp matches ..-1 run scoreboard players set #bar_value vortex.dialog_tmp 0
execute if score #bar_value vortex.dialog_tmp > #bar_max vortex.dialog_tmp run scoreboard players operation #bar_value vortex.dialog_tmp = #bar_max vortex.dialog_tmp
execute store result score #bar_segments vortex.dialog_tmp run data get storage vortex:dialog_work progress_style.segments
execute store result score #bar_width vortex.dialog_tmp run data get storage vortex:dialog_work progress_style.width
execute unless score #bar_segments vortex.dialog_tmp matches 1..64 run return 0
execute unless score #bar_width vortex.dialog_tmp matches 1..1024 run return 0
scoreboard players operation #bar_fill vortex.dialog_tmp = #bar_value vortex.dialog_tmp
scoreboard players operation #bar_fill vortex.dialog_tmp *= #bar_segments vortex.dialog_tmp
scoreboard players operation #bar_fill vortex.dialog_tmp /= #bar_max vortex.dialog_tmp
scoreboard players operation #bar_percent vortex.dialog_tmp = #bar_value vortex.dialog_tmp
scoreboard players set #bar_hundred vortex.dialog_tmp 100
scoreboard players operation #bar_percent vortex.dialog_tmp *= #bar_hundred vortex.dialog_tmp
scoreboard players operation #bar_percent vortex.dialog_tmp /= #bar_max vortex.dialog_tmp
data modify storage vortex:dialog_progress component set value {text:"",extra:[]}
data modify storage vortex:dialog_progress component.extra append from storage vortex:dialog_progress input.label
data modify storage vortex:dialog_progress component.extra append value {text:" [",color:"gray"}
scoreboard players set #bar_index vortex.dialog_tmp 0
function vortex:core/internal/dialog/progress_segments
execute store result storage vortex:dialog_progress result.value int 1 run scoreboard players get #bar_value vortex.dialog_tmp
execute store result storage vortex:dialog_progress result.max int 1 run scoreboard players get #bar_max vortex.dialog_tmp
execute store result storage vortex:dialog_progress result.filled int 1 run scoreboard players get #bar_fill vortex.dialog_tmp
execute store result storage vortex:dialog_progress result.segments int 1 run scoreboard players get #bar_segments vortex.dialog_tmp
execute store result storage vortex:dialog_progress result.percent int 1 run scoreboard players get #bar_percent vortex.dialog_tmp
function vortex:core/internal/dialog/progress_caption with storage vortex:dialog_progress result
data modify storage vortex:dialog_progress body set value {type:"minecraft:plain_message"}
data modify storage vortex:dialog_progress body.contents set from storage vortex:dialog_progress component
data modify storage vortex:dialog_progress body.width set from storage vortex:dialog_work progress_style.width
data modify storage vortex:dialog_work dialog.body append from storage vortex:dialog_progress body
return 1
