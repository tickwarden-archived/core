# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/repeat/run
execute store result score $rep_r vortex.tmp run data get storage vortex:engine _repeat.remaining
execute if score $rep_r vortex.tmp matches ..0 run execute as @s run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"lib/repeat ","color":"aqua"},{"text":"DONE ","color":"green"},{"text":"all iterations completed","color":"#555555"}]
execute if score $rep_r vortex.tmp matches ..0 run return 0

function vortex:core/internal/core/lib/repeat/call with storage vortex:engine _repeat

scoreboard players remove $rep_r vortex.tmp 1
execute store result storage vortex:engine _repeat.remaining int 1 run scoreboard players get $rep_r vortex.tmp
execute store result score $rep_i vortex.tmp run data get storage vortex:engine _repeat.i
scoreboard players add $rep_i vortex.tmp 1
execute store result storage vortex:engine _repeat.i int 1 run scoreboard players get $rep_i vortex.tmp

function vortex:core/internal/core/lib/repeat/run
