execute if score #phase vfEc8645e117f matches 1 run tellraw @a {"text": "[VortaForge EOL] core-054e268687fd: warning phase; function restrictions after 5184000 ticks and lock after 12096000 ticks (72 and 168 hours only at 20 TPS).", "color": "gold"}
execute if score #phase vfEc8645e117f matches 2 run tellraw @a {"text": "[VortaForge EOL] core-054e268687fd: restricted functions phase; non-function data and external commands are not blocked. Persistent world data is NOT erased.", "color": "gold"}
execute if score #phase vfEc8645e117f matches 3 run tellraw @a {"text": "[VortaForge EOL] core-054e268687fd: EOL locked. Use function vf_eol_c8645e117f:status for lifecycle state.", "color": "gold"}
scoreboard players operation #last vfEc8645e117f = #phase vfEc8645e117f
