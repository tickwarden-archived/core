execute unless data storage vf_eol_46942fd13a:lifecycle initialized run scoreboard objectives add vfE46942fd13a dummy
data modify storage vf_eol_46942fd13a:lifecycle initialized set value 1b
scoreboard players add #ticks vfE46942fd13a 0
scoreboard players add #phase vfE46942fd13a 0
scoreboard players add #last vfE46942fd13a 0
scoreboard players add #cleaned vfE46942fd13a 0
function vf_eol_46942fd13a:refresh
execute unless score #last vfE46942fd13a = #phase vfE46942fd13a run function vf_eol_46942fd13a:notice
