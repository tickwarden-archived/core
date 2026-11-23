execute if score #phase vfE63b504a29e matches 1 run tellraw @a {"text": "[VortaForge EOL] vortex-5154be20712d: warning phase; function restrictions after 5184000 ticks and lock after 12096000 ticks (72 and 168 hours only at 20 TPS).", "color": "gold"}
execute if score #phase vfE63b504a29e matches 2 run tellraw @a {"text": "[VortaForge EOL] vortex-5154be20712d: restricted functions phase; non-function data and external commands are not blocked. Persistent world data is NOT erased.", "color": "gold"}
execute if score #phase vfE63b504a29e matches 3 run tellraw @a {"text": "[VortaForge EOL] vortex-5154be20712d: EOL locked. Use function vf_eol_63b504a29e:status for lifecycle state.", "color": "gold"}
scoreboard players operation #last vfE63b504a29e = #phase vfE63b504a29e
