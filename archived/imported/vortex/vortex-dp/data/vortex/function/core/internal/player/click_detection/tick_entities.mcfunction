# vortex:core/internal/player/click_detection/tick_entities
schedule function vortex:core/internal/player/click_detection/tick_entities 100t
execute as @e[type=minecraft:interaction,tag=vortex.player_action.click_entity] at @s run function vortex:core/internal/player/click_detection/tick_entities_2
