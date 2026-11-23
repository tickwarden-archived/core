# vortex:world/entity/count [MACRO]
scoreboard players set $ent_count vortex.tmp 0
$execute as @e[type=$(type),tag=$(tag)] run scoreboard players add $ent_count vortex.tmp 1
execute store result storage vortex:output count int 1 run scoreboard players get $ent_count vortex.tmp
