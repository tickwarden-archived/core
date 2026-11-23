# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# copy uuid
scoreboard players operation #uuid.0 vortex.player_action.data = @s vortex.player_action.uuid.0
scoreboard players operation #uuid.1 vortex.player_action.data = @s vortex.player_action.uuid.1
scoreboard players operation #uuid.2 vortex.player_action.data = @s vortex.player_action.uuid.2
scoreboard players operation #uuid.3 vortex.player_action.data = @s vortex.player_action.uuid.3

# start detection
execute if entity @s[tag=!vortex.player_action.click_detection] run function vortex:core/internal/player/click_detection/start

# teleport villager
execute if entity @s[tag=!vortex.player_action.moving] as @e[type=minecraft:interaction,tag=vortex.player_action.click_entity,predicate=vortex:core/internal/player/equals_uuid] run tp @s ~ ~0.75 ~
execute if entity @s[tag=vortex.player_action.moving] as @e[type=minecraft:interaction,tag=vortex.player_action.click_entity,predicate=vortex:core/internal/player/equals_uuid] positioned ~ ~0.75 ~ run tp @s ^ ^ ^1.5
