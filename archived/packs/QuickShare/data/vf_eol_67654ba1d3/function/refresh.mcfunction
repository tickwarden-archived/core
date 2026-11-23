scoreboard players set #phase vfE67654ba1d3 1
execute if score #ticks vfE67654ba1d3 matches 5184000.. run scoreboard players set #phase vfE67654ba1d3 2
execute if score #ticks vfE67654ba1d3 matches 12096000.. run scoreboard players set #phase vfE67654ba1d3 3
execute store result storage vf_eol_67654ba1d3:lifecycle phase int 1 run scoreboard players get #phase vfE67654ba1d3
