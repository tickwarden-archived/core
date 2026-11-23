# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# Vortex player module — cache the player's UUID into scores so other
# systems can compare identities via scoreboard logic.

execute store result score @s vortex.player_action.uuid.0 run data get entity @s UUID[0]
execute store result score @s vortex.player_action.uuid.1 run data get entity @s UUID[1]
execute store result score @s vortex.player_action.uuid.2 run data get entity @s UUID[2]
execute store result score @s vortex.player_action.uuid.3 run data get entity @s UUID[3]
