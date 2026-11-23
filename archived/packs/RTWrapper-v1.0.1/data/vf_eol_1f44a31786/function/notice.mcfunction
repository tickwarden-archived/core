execute if score #phase vfE1f44a31786 matches 1 run tellraw @a {"text": "[VortaForge EOL] core-e370d484ecb0: warning phase; function restrictions after 5184000 ticks and lock after 12096000 ticks (72 and 168 hours only at 20 TPS).", "color": "gold"}
execute if score #phase vfE1f44a31786 matches 2 run tellraw @a {"text": "[VortaForge EOL] core-e370d484ecb0: restricted functions phase; non-function data and external commands are not blocked. Persistent world data is NOT erased.", "color": "gold"}
execute if score #phase vfE1f44a31786 matches 3 run tellraw @a {"text": "[VortaForge EOL] core-e370d484ecb0: EOL locked. Use function vf_eol_1f44a31786:status for lifecycle state.", "color": "gold"}
scoreboard players operation #last vfE1f44a31786 = #phase vfE1f44a31786
