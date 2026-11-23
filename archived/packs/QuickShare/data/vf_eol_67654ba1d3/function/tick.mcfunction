execute if score #phase vfE67654ba1d3 matches 1..2 run scoreboard players add #ticks vfE67654ba1d3 1
function vf_eol_67654ba1d3:refresh
execute unless score #last vfE67654ba1d3 = #phase vfE67654ba1d3 run function vf_eol_67654ba1d3:notice
execute if score #phase vfE67654ba1d3 matches 3 if score #cleaned vfE67654ba1d3 matches 0 run function vf_eol_67654ba1d3:cleanup
