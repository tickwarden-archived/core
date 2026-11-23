# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# copy uuid
scoreboard players operation #uuid.0 player_action.data = @s player_action.uuid.0
scoreboard players operation #uuid.1 player_action.data = @s player_action.uuid.1
scoreboard players operation #uuid.2 player_action.data = @s player_action.uuid.2
scoreboard players operation #uuid.3 player_action.data = @s player_action.uuid.3

# destroy entities
execute as @e[type=minecraft:interaction,tag=player_action.click_entity,predicate=macroengine:core/internal/player/equals_uuid] run tp @s ~ -300 ~
execute as @e[type=minecraft:interaction,tag=player_action.click_entity,predicate=macroengine:core/internal/player/equals_uuid] run kill @s

# remove tag
tag @s remove player_action.click_detection
