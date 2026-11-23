execute if score #phase vfE55b54ff038 matches 1 run tellraw @a {"text": "[VortaForge EOL] vortex-92441e84db98: warning phase; function restrictions after 5184000 ticks and lock after 12096000 ticks (72 and 168 hours only at 20 TPS).", "color": "gold"}
execute if score #phase vfE55b54ff038 matches 2 run tellraw @a {"text": "[VortaForge EOL] vortex-92441e84db98: restricted functions phase; non-function data and external commands are not blocked. Persistent world data is NOT erased.", "color": "gold"}
execute if score #phase vfE55b54ff038 matches 3 run tellraw @a {"text": "[VortaForge EOL] vortex-92441e84db98: EOL locked. Use function vf_eol_55b54ff038:status for lifecycle state.", "color": "gold"}
scoreboard players operation #last vfE55b54ff038 = #phase vfE55b54ff038
