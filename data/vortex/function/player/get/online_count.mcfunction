# vortex:player/get/online_count
scoreboard players set $poc vortex.tmp 0
execute as @a run scoreboard players add $poc vortex.tmp 1
execute store result storage vortex:output result int 1 run scoreboard players get $poc vortex.tmp
