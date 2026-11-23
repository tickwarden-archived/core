# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/player/click_detection/tick_entities_2
execute store result score #temp vortex.player_action.data if entity @a[distance=..10,tag=vortex.player_action.click_detection]
execute if score #temp vortex.player_action.data matches 0 run tp @s ~ -300 ~
execute if score #temp vortex.player_action.data matches 0 run kill @s
