execute if score #phase vfEf98a9615fe matches 1 run tellraw @a {"text": "[VortaForge EOL] core-7dc59306347b: warning phase; function restrictions after 5184000 ticks and lock after 12096000 ticks (72 and 168 hours only at 20 TPS).", "color": "gold"}
execute if score #phase vfEf98a9615fe matches 2 run tellraw @a {"text": "[VortaForge EOL] core-7dc59306347b: restricted functions phase; non-function data and external commands are not blocked. Persistent world data is NOT erased.", "color": "gold"}
execute if score #phase vfEf98a9615fe matches 3 run tellraw @a {"text": "[VortaForge EOL] core-7dc59306347b: EOL locked. Use function vf_eol_f98a9615fe:status for lifecycle state.", "color": "gold"}
scoreboard players operation #last vfEf98a9615fe = #phase vfEf98a9615fe
