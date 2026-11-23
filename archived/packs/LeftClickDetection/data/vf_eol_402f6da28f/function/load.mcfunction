execute unless data storage vf_eol_402f6da28f:lifecycle initialized run scoreboard objectives add vfE402f6da28f dummy
data modify storage vf_eol_402f6da28f:lifecycle initialized set value 1b
scoreboard players add #ticks vfE402f6da28f 0
scoreboard players add #phase vfE402f6da28f 0
scoreboard players add #last vfE402f6da28f 0
scoreboard players add #cleaned vfE402f6da28f 0
function vf_eol_402f6da28f:refresh
execute unless score #last vfE402f6da28f = #phase vfE402f6da28f run function vf_eol_402f6da28f:notice
