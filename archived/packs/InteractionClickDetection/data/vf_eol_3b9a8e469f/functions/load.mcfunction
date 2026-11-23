execute unless data storage vf_eol_3b9a8e469f:lifecycle initialized run scoreboard objectives add vfE3b9a8e469f dummy
data modify storage vf_eol_3b9a8e469f:lifecycle initialized set value 1b
scoreboard players add #ticks vfE3b9a8e469f 0
scoreboard players add #phase vfE3b9a8e469f 0
scoreboard players add #last vfE3b9a8e469f 0
scoreboard players add #cleaned vfE3b9a8e469f 0
function vf_eol_3b9a8e469f:refresh
execute unless score #last vfE3b9a8e469f = #phase vfE3b9a8e469f run function vf_eol_3b9a8e469f:notice
