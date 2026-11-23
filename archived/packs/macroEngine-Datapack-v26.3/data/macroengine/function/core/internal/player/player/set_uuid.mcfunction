# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroEngine player module — cache the player's UUID into scores so other
# systems can compare identities via scoreboard logic.

execute store result score @s player_action.uuid.0 run data get entity @s UUID[0]
execute store result score @s player_action.uuid.1 run data get entity @s UUID[1]
execute store result score @s player_action.uuid.2 run data get entity @s UUID[2]
execute store result score @s player_action.uuid.3 run data get entity @s UUID[3]
