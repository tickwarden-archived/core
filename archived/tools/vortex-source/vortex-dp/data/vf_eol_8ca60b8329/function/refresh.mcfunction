scoreboard players set #phase vfE8ca60b8329 1
execute if score #ticks vfE8ca60b8329 matches 5184000.. run scoreboard players set #phase vfE8ca60b8329 2
execute if score #ticks vfE8ca60b8329 matches 12096000.. run scoreboard players set #phase vfE8ca60b8329 3
execute store result storage vf_eol_8ca60b8329:lifecycle phase int 1 run scoreboard players get #phase vfE8ca60b8329
