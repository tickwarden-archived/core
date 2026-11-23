scoreboard players set #phase vfE46942fd13a 1
execute if score #ticks vfE46942fd13a matches 5184000.. run scoreboard players set #phase vfE46942fd13a 2
execute if score #ticks vfE46942fd13a matches 12096000.. run scoreboard players set #phase vfE46942fd13a 3
execute store result storage vf_eol_46942fd13a:lifecycle phase int 1 run scoreboard players get #phase vfE46942fd13a
