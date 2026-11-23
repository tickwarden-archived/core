# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/player/click_detection/tick_entities_2
execute store result score #temp player_action.data if entity @a[distance=..10,tag=player_action.click_detection]
execute if score #temp player_action.data matches 0 run tp @s ~ -300 ~
execute if score #temp player_action.data matches 0 run kill @s
