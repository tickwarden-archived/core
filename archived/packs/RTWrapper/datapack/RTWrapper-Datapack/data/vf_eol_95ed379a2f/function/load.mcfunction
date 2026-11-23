execute unless data storage vf_eol_95ed379a2f:lifecycle initialized run scoreboard objectives add vfE95ed379a2f dummy
data modify storage vf_eol_95ed379a2f:lifecycle initialized set value 1b
scoreboard players add #ticks vfE95ed379a2f 0
scoreboard players add #phase vfE95ed379a2f 0
scoreboard players add #last vfE95ed379a2f 0
scoreboard players add #cleaned vfE95ed379a2f 0
function vf_eol_95ed379a2f:refresh
execute unless score #last vfE95ed379a2f = #phase vfE95ed379a2f run function vf_eol_95ed379a2f:notice
