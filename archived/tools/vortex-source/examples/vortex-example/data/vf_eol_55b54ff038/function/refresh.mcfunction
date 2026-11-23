scoreboard players set #phase vfE55b54ff038 1
execute if score #ticks vfE55b54ff038 matches 5184000.. run scoreboard players set #phase vfE55b54ff038 2
execute if score #ticks vfE55b54ff038 matches 12096000.. run scoreboard players set #phase vfE55b54ff038 3
execute store result storage vf_eol_55b54ff038:lifecycle phase int 1 run scoreboard players get #phase vfE55b54ff038
