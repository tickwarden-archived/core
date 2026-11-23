# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/player/click_detection/tick_entities
schedule function vortex:core/internal/player/click_detection/tick_entities 100t
execute as @e[type=minecraft:interaction,tag=vortex.player_action.click_entity] at @s run function vortex:core/internal/player/click_detection/tick_entities_2
