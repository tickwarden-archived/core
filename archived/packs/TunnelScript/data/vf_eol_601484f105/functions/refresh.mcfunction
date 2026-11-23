scoreboard players set #phase vfE601484f105 1
execute if score #ticks vfE601484f105 matches 5184000.. run scoreboard players set #phase vfE601484f105 2
execute if score #ticks vfE601484f105 matches 12096000.. run scoreboard players set #phase vfE601484f105 3
execute store result storage vf_eol_601484f105:lifecycle phase int 1 run scoreboard players get #phase vfE601484f105
