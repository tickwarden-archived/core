execute if score #phase vfEf11a08b8a7 matches 1 run tellraw @a {"text": "[VortaForge EOL] core-e43c0c672bcb: warning phase; function restrictions after 5184000 ticks and lock after 12096000 ticks (72 and 168 hours only at 20 TPS).", "color": "gold"}
execute if score #phase vfEf11a08b8a7 matches 2 run tellraw @a {"text": "[VortaForge EOL] core-e43c0c672bcb: restricted functions phase; non-function data and external commands are not blocked. Persistent world data is NOT erased.", "color": "gold"}
execute if score #phase vfEf11a08b8a7 matches 3 run tellraw @a {"text": "[VortaForge EOL] core-e43c0c672bcb: EOL locked. Use function vf_eol_f11a08b8a7:status for lifecycle state.", "color": "gold"}
scoreboard players operation #last vfEf11a08b8a7 = #phase vfEf11a08b8a7
