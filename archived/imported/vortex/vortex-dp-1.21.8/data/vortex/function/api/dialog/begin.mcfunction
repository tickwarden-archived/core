# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/begin
# @s player. Shared draft: finish synchronously before any other builder begins.
execute unless entity @s[type=minecraft:player] run return 0
execute unless score @s vortex.dialog_id matches 1.. run function vortex:core/internal/dialog/identify
function vortex:core/internal/dialog/context
data remove storage vortex:dialog_work disabled_last
data remove storage vortex:dialog_work dialog
data remove storage vortex:dialog_work routes
data remove storage vortex:dialog_work form
data remove storage vortex:dialog_work view
data remove storage vortex:dialog_work catalog
data remove storage vortex:dialog_work route
data remove storage vortex:dialog_work progress_style
data remove storage vortex:dialog_work refresh
data remove storage vortex:dialog_work theme
data remove storage vortex:dialog_work notification
data merge storage vortex:dialog_work {dialog:{type:"minecraft:multi_action",title:{text:"Vortex",color:"aqua"},body:[],inputs:[],actions:[],columns:2,pause:0b,can_close_with_escape:1b,after_action:"wait_for_response"},routes:[],form:{},view:{},catalog:{}}
data modify storage vortex:dialog_work progress_style set value {segments:20,width:300,filled:{text:"|",color:"green"},empty:{text:"|",color:"dark_gray"}}
data modify storage vortex:dialog_work refresh set value {}
data modify storage vortex:dialog_work theme set value {}
execute store result storage vortex:dialog_work owner int 1 run scoreboard players get @s vortex.dialog_id
