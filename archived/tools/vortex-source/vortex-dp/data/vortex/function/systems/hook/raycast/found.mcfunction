# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# Block found!
# Increment hook.placed scoreboard
execute if data storage vortex:engine modules{hook:0b} run return 0
scoreboard players add @s vortex.hook_placed 1

# Write to hook event storage (other systems can listen)
# Save block coordinates (via marker summon from positioned context)
summon minecraft:marker ~ ~ ~ {Tags:["vortex.hook_block_pos"]}
execute store result storage vortex:hook placed.x int 1 run data get entity @e[type=minecraft:marker,tag=vortex.hook_block_pos,limit=1] Pos[0]
execute store result storage vortex:hook placed.y int 1 run data get entity @e[type=minecraft:marker,tag=vortex.hook_block_pos,limit=1] Pos[1]
execute store result storage vortex:hook placed.z int 1 run data get entity @e[type=minecraft:marker,tag=vortex.hook_block_pos,limit=1] Pos[2]
kill @e[type=minecraft:marker,tag=vortex.hook_block_pos,limit=1]

# Record timestamp (from vortex.time scoreboard)
execute store result storage vortex:hook placed.tick int 1 run scoreboard players get #time vortex.time

# Get player UUID and name via vortex modules
execute as @s run function vortex:systems/uuid/from_entity
data modify storage vortex:hook placed.uuid set from storage vortex:output uuid

execute as @s run function vortex:api/player/get/name
data modify storage vortex:hook placed.name set from storage vortex:names temp.NAME
data modify storage vortex:hook placed.uuid_array set from storage vortex:names temp.UUID

# Set hook event flag
data modify storage vortex:hook placed.active set value 1b

# Hook event sistemine "placed_block" event'i fire et
data modify storage vortex:engine _hook_fire_tmp set value {event:"placed_block"}
execute as @s run function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp

# Legacy event system support (if present)
execute if score #m_hook vortex.flags matches 1.. run function vortex:events/fire {id:"hook.placed"}

# Cleanup: reset counter
scoreboard players reset @s vortex.tmp
