# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# Vortex player module — movement detection.
# Compares the current position with the cached one (scaled by 70 to keep
# sub-block motion visible after the int cast); any axis change marks the
# player as moving, then the cache is refreshed.

data modify storage vortex:player_tmp list set from entity @s Pos

# X axis
execute store result score #x vortex.player_action.data run data get storage vortex:player_tmp list[0] 70
scoreboard players operation #temp vortex.player_action.data = #x vortex.player_action.data
scoreboard players operation #temp vortex.player_action.data -= @s vortex.player_action.x
execute unless score #temp vortex.player_action.data matches 0 run tag @s add vortex.player_action.moving

# Y axis
execute store result score #y vortex.player_action.data run data get storage vortex:player_tmp list[1] 70
scoreboard players operation #temp vortex.player_action.data = #y vortex.player_action.data
scoreboard players operation #temp vortex.player_action.data -= @s vortex.player_action.y
execute unless score #temp vortex.player_action.data matches 0 run tag @s add vortex.player_action.moving

# Z axis
execute store result score #z vortex.player_action.data run data get storage vortex:player_tmp list[2] 70
scoreboard players operation #temp vortex.player_action.data = #z vortex.player_action.data
scoreboard players operation #temp vortex.player_action.data -= @s vortex.player_action.z
execute unless score #temp vortex.player_action.data matches 0 run tag @s add vortex.player_action.moving

# Refresh the cache for the next tick
scoreboard players operation @s vortex.player_action.x = #x vortex.player_action.data
scoreboard players operation @s vortex.player_action.y = #y vortex.player_action.data
scoreboard players operation @s vortex.player_action.z = #z vortex.player_action.data
