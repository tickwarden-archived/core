execute if score #phase vfE46942fd13a matches 1 run tellraw @a {"text": "[VortaForge EOL] core-62c96bf76d3b: warning phase; function restrictions after 5184000 ticks and lock after 12096000 ticks (72 and 168 hours only at 20 TPS).", "color": "gold"}
execute if score #phase vfE46942fd13a matches 2 run tellraw @a {"text": "[VortaForge EOL] core-62c96bf76d3b: restricted functions phase; non-function data and external commands are not blocked. Persistent world data is NOT erased.", "color": "gold"}
execute if score #phase vfE46942fd13a matches 3 run tellraw @a {"text": "[VortaForge EOL] core-62c96bf76d3b: EOL locked. Use function vf_eol_46942fd13a:status for lifecycle state.", "color": "gold"}
scoreboard players operation #last vfE46942fd13a = #phase vfE46942fd13a
