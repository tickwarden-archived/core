execute unless data storage vf_eol_1f44a31786:lifecycle initialized run scoreboard objectives add vfE1f44a31786 dummy
data modify storage vf_eol_1f44a31786:lifecycle initialized set value 1b
scoreboard players add #ticks vfE1f44a31786 0
scoreboard players add #phase vfE1f44a31786 0
scoreboard players add #last vfE1f44a31786 0
scoreboard players add #cleaned vfE1f44a31786 0
function vf_eol_1f44a31786:refresh
execute unless score #last vfE1f44a31786 = #phase vfE1f44a31786 run function vf_eol_1f44a31786:notice
