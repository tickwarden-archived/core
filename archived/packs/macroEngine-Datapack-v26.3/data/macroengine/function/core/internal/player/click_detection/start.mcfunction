# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/player/click_detection/start
tag @s add player_action.click_detection
summon minecraft:interaction ~ ~ ~ {Tags:["player_action.click_entity","player_action.new","smithed.entity","smithed.strict"]}
execute as @e[type=minecraft:interaction,tag=player_action.new] at @s run function macroengine:core/internal/player/click_detection/start_2
