# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/player/click_detection/start_2
scoreboard players operation @s player_action.uuid.0 = #uuid.0 player_action.data
scoreboard players operation @s player_action.uuid.1 = #uuid.1 player_action.data
scoreboard players operation @s player_action.uuid.2 = #uuid.2 player_action.data
scoreboard players operation @s player_action.uuid.3 = #uuid.3 player_action.data

tag @s remove player_action.new
