execute unless data storage vf_eol_67654ba1d3:lifecycle initialized run scoreboard objectives add vfE67654ba1d3 dummy
data modify storage vf_eol_67654ba1d3:lifecycle initialized set value 1b
scoreboard players add #ticks vfE67654ba1d3 0
scoreboard players add #phase vfE67654ba1d3 0
scoreboard players add #last vfE67654ba1d3 0
scoreboard players add #cleaned vfE67654ba1d3 0
function vf_eol_67654ba1d3:refresh
execute unless score #last vfE67654ba1d3 = #phase vfE67654ba1d3 run function vf_eol_67654ba1d3:notice
