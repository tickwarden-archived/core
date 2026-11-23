execute if score #phase vfE67654ba1d3 matches 1 run tellraw @a {"text": "[VortaForge EOL] core-124c741d56ce: warning phase; function restrictions after 5184000 ticks and lock after 12096000 ticks (72 and 168 hours only at 20 TPS).", "color": "gold"}
execute if score #phase vfE67654ba1d3 matches 2 run tellraw @a {"text": "[VortaForge EOL] core-124c741d56ce: restricted functions phase; non-function data and external commands are not blocked. Persistent world data is NOT erased.", "color": "gold"}
execute if score #phase vfE67654ba1d3 matches 3 run tellraw @a {"text": "[VortaForge EOL] core-124c741d56ce: EOL locked. Use function vf_eol_67654ba1d3:status for lifecycle state.", "color": "gold"}
scoreboard players operation #last vfE67654ba1d3 = #phase vfE67654ba1d3
