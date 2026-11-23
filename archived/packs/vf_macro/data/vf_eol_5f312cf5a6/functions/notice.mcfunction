execute if score #phase vfE5f312cf5a6 matches 1 run tellraw @a {"text": "[VortaForge EOL] core-5b836e483e78: warning phase; function restrictions after 5184000 ticks and lock after 12096000 ticks (72 and 168 hours only at 20 TPS).", "color": "gold"}
execute if score #phase vfE5f312cf5a6 matches 2 run tellraw @a {"text": "[VortaForge EOL] core-5b836e483e78: restricted functions phase; non-function data and external commands are not blocked. Persistent world data is NOT erased.", "color": "gold"}
execute if score #phase vfE5f312cf5a6 matches 3 run tellraw @a {"text": "[VortaForge EOL] core-5b836e483e78: EOL locked. Use function vf_eol_5f312cf5a6:status for lifecycle state.", "color": "gold"}
scoreboard players operation #last vfE5f312cf5a6 = #phase vfE5f312cf5a6
