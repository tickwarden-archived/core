# vortex:core/lib/queue/process
scoreboard players add $pq_depth vortex.tmp 1
execute if score $pq_depth vortex.tmp > #queue_cap vortex.tick run return 0

execute unless data storage vortex:engine queue[0] run return 0

execute store result score $qdel vortex.tmp run data get storage vortex:engine queue[0].delay

scoreboard players remove $qdel vortex.tmp 1
execute store result storage vortex:engine queue[0].delay int 1 run scoreboard players get $qdel vortex.tmp

execute if score $qdel vortex.tmp matches ..0 run function vortex:core/internal/core/lib/queue/fire
execute if score $qdel vortex.tmp matches ..0 run function vortex:core/lib/queue/process
