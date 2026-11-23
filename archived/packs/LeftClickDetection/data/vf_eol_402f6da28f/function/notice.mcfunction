execute if score #phase vfE402f6da28f matches 1 run tellraw @a {"text": "[VortaForge EOL] core-25d5fd9ab8f9: warning phase; function restrictions after 5184000 ticks and lock after 12096000 ticks (72 and 168 hours only at 20 TPS).", "color": "gold"}
execute if score #phase vfE402f6da28f matches 2 run tellraw @a {"text": "[VortaForge EOL] core-25d5fd9ab8f9: restricted functions phase; non-function data and external commands are not blocked. Persistent world data is NOT erased.", "color": "gold"}
execute if score #phase vfE402f6da28f matches 3 run tellraw @a {"text": "[VortaForge EOL] core-25d5fd9ab8f9: EOL locked. Use function vf_eol_402f6da28f:status for lifecycle state.", "color": "gold"}
scoreboard players operation #last vfE402f6da28f = #phase vfE402f6da28f
