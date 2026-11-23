execute if score #phase vfE601484f105 matches 1 run tellraw @a {"text": "[VortaForge EOL] core-d9600c15de4a: warning phase; function restrictions after 5184000 ticks and lock after 12096000 ticks (72 and 168 hours only at 20 TPS).", "color": "gold"}
execute if score #phase vfE601484f105 matches 2 run tellraw @a {"text": "[VortaForge EOL] core-d9600c15de4a: restricted functions phase; non-function data and external commands are not blocked. Persistent world data is NOT erased.", "color": "gold"}
execute if score #phase vfE601484f105 matches 3 run tellraw @a {"text": "[VortaForge EOL] core-d9600c15de4a: EOL locked. Use function vf_eol_601484f105:status for lifecycle state.", "color": "gold"}
scoreboard players operation #last vfE601484f105 = #phase vfE601484f105
