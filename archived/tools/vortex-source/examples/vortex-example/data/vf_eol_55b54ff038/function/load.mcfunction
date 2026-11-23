execute unless data storage vf_eol_55b54ff038:lifecycle initialized run scoreboard objectives add vfE55b54ff038 dummy
data modify storage vf_eol_55b54ff038:lifecycle initialized set value 1b
scoreboard players add #ticks vfE55b54ff038 0
scoreboard players add #phase vfE55b54ff038 0
scoreboard players add #last vfE55b54ff038 0
scoreboard players add #cleaned vfE55b54ff038 0
function vf_eol_55b54ff038:refresh
execute unless score #last vfE55b54ff038 = #phase vfE55b54ff038 run function vf_eol_55b54ff038:notice
