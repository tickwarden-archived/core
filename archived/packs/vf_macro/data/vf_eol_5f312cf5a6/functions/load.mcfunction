execute unless data storage vf_eol_5f312cf5a6:lifecycle initialized run scoreboard objectives add vfE5f312cf5a6 dummy
data modify storage vf_eol_5f312cf5a6:lifecycle initialized set value 1b
scoreboard players add #ticks vfE5f312cf5a6 0
scoreboard players add #phase vfE5f312cf5a6 0
scoreboard players add #last vfE5f312cf5a6 0
scoreboard players add #cleaned vfE5f312cf5a6 0
function vf_eol_5f312cf5a6:refresh
execute unless score #last vfE5f312cf5a6 = #phase vfE5f312cf5a6 run function vf_eol_5f312cf5a6:notice
