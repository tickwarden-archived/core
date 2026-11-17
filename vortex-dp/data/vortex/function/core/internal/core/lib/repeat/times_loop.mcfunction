# vortex:core/internal/core/lib/repeat/times_loop
execute if score $rn_i vortex.tmp >= $rn_n vortex.tmp run return 0

execute store result score $repeat_i vortex.tmp run scoreboard players get $rn_i vortex.tmp
function vortex:core/internal/core/lib/repeat/times_call with storage vortex:engine {}
scoreboard players add $rn_i vortex.tmp 1
function vortex:core/internal/core/lib/repeat/times_loop
