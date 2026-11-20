# vortex:core/internal/core/lib/for_each/list_step
execute unless data storage vortex:engine _felist_input[0] run execute as @s run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"lib/for_each_list ","color":"aqua"},{"text":"DONE ","color":"green"},{"text":"list exhausted, loop ended","color":"#555555"}]
execute unless data storage vortex:engine _felist_input[0] run return 0

data modify storage vortex:engine _felist_current set from storage vortex:engine _felist_input[0]

function vortex:core/internal/core/lib/for_each/list_call with storage vortex:engine _felist_state

data remove storage vortex:engine _felist_input[0]
scoreboard players add $felist_i vortex.tmp 1

function vortex:core/internal/core/lib/for_each/list_step
