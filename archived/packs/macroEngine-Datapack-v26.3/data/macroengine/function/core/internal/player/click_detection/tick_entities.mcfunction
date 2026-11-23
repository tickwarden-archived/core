# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/player/click_detection/tick_entities
schedule function macroengine:core/internal/player/click_detection/tick_entities 100t
execute as @e[type=minecraft:interaction,tag=player_action.click_entity] at @s run function macroengine:core/internal/player/click_detection/tick_entities_2
