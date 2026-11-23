execute if score #phase vfE8ca60b8329 matches 1 run tellraw @a {"text": "[VortaForge EOL] vortex-05d16a42219e: warning phase; function restrictions after 5184000 ticks and lock after 12096000 ticks (72 and 168 hours only at 20 TPS).", "color": "gold"}
execute if score #phase vfE8ca60b8329 matches 2 run tellraw @a {"text": "[VortaForge EOL] vortex-05d16a42219e: restricted functions phase; non-function data and external commands are not blocked. Persistent world data is NOT erased.", "color": "gold"}
execute if score #phase vfE8ca60b8329 matches 3 run tellraw @a {"text": "[VortaForge EOL] vortex-05d16a42219e: EOL locked. Use function vf_eol_8ca60b8329:status for lifecycle state.", "color": "gold"}
scoreboard players operation #last vfE8ca60b8329 = #phase vfE8ca60b8329
