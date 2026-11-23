scoreboard players set #phase vfEcc1cb841d8 1
execute if score #ticks vfEcc1cb841d8 matches 5184000.. run scoreboard players set #phase vfEcc1cb841d8 2
execute if score #ticks vfEcc1cb841d8 matches 12096000.. run scoreboard players set #phase vfEcc1cb841d8 3
execute store result storage vf_eol_cc1cb841d8:lifecycle phase int 1 run scoreboard players get #phase vfEcc1cb841d8
