execute if score #phase vfE3b9a8e469f matches 1 run tellraw @a {"text": "[VortaForge EOL] core-160267d56371: warning phase; function restrictions after 5184000 ticks and lock after 12096000 ticks (72 and 168 hours only at 20 TPS).", "color": "gold"}
execute if score #phase vfE3b9a8e469f matches 2 run tellraw @a {"text": "[VortaForge EOL] core-160267d56371: restricted functions phase; non-function data and external commands are not blocked. Persistent world data is NOT erased.", "color": "gold"}
execute if score #phase vfE3b9a8e469f matches 3 run tellraw @a {"text": "[VortaForge EOL] core-160267d56371: EOL locked. Use function vf_eol_3b9a8e469f:status for lifecycle state.", "color": "gold"}
scoreboard players operation #last vfE3b9a8e469f = #phase vfE3b9a8e469f
