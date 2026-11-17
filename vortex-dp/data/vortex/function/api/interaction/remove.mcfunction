# vortex:api/interaction/remove [MACRO]
execute if data storage vortex:engine modules{interaction:0b} run return 0
$kill @e[type=minecraft:interaction,tag=vortex.interaction,tag=$(tag)]
