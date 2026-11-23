execute if score #phase vfE95ed379a2f matches 1 run tellraw @a {"text": "[VortaForge EOL] core-fe13f9ed5b98: warning phase; function restrictions after 5184000 ticks and lock after 12096000 ticks (72 and 168 hours only at 20 TPS).", "color": "gold"}
execute if score #phase vfE95ed379a2f matches 2 run tellraw @a {"text": "[VortaForge EOL] core-fe13f9ed5b98: restricted functions phase; non-function data and external commands are not blocked. Persistent world data is NOT erased.", "color": "gold"}
execute if score #phase vfE95ed379a2f matches 3 run tellraw @a {"text": "[VortaForge EOL] core-fe13f9ed5b98: EOL locked. Use function vf_eol_95ed379a2f:status for lifecycle state.", "color": "gold"}
scoreboard players operation #last vfE95ed379a2f = #phase vfE95ed379a2f
