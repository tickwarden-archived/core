# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/player/click_detection/start_2
scoreboard players operation @s vortex.player_action.uuid.0 = #uuid.0 vortex.player_action.data
scoreboard players operation @s vortex.player_action.uuid.1 = #uuid.1 vortex.player_action.data
scoreboard players operation @s vortex.player_action.uuid.2 = #uuid.2 vortex.player_action.data
scoreboard players operation @s vortex.player_action.uuid.3 = #uuid.3 vortex.player_action.data

tag @s remove vortex.player_action.new
