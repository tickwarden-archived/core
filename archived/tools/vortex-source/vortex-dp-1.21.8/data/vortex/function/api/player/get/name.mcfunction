# vortex:api/player/get/name
# Resolves the executor's profile name and UUID into vortex:names temp.
# Uses a short-lived marker armor_stand at the execution position instead of a block,
# so no world position (and no loaded chunk at a fixed coordinate) is required.
data remove storage vortex:names temp

summon minecraft:armor_stand ~ ~ ~ {Tags:["vortex.name_tmp"],Invisible:1b,Marker:1b,NoGravity:1b,Silent:1b,Invulnerable:1b}

loot replace entity @e[type=minecraft:armor_stand,tag=vortex.name_tmp,sort=nearest,limit=1] armor.head loot vortex:player/head

data modify storage vortex:names temp.NAME set from entity @e[type=minecraft:armor_stand,tag=vortex.name_tmp,sort=nearest,limit=1] equipment.head.components."minecraft:profile".name

data modify storage vortex:names temp.UUID insert 0 from entity @s UUID[0]
data modify storage vortex:names temp.UUID insert 1 from entity @s UUID[1]
data modify storage vortex:names temp.UUID insert 2 from entity @s UUID[2]
data modify storage vortex:names temp.UUID insert 3 from entity @s UUID[3]

kill @e[type=minecraft:armor_stand,tag=vortex.name_tmp]
