scoreboard players set #phase vfE63b504a29e 1
execute if score #ticks vfE63b504a29e matches 5184000.. run scoreboard players set #phase vfE63b504a29e 2
execute if score #ticks vfE63b504a29e matches 12096000.. run scoreboard players set #phase vfE63b504a29e 3
execute store result storage vf_eol_63b504a29e:lifecycle phase int 1 run scoreboard players get #phase vfE63b504a29e
