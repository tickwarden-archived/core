# Vortex player module — module marker (load step 1 of 3).
# Vortex targets a single Minecraft version per pack, so instead of
# probing for installed library versions we simply pin the module marker
# that other parts of the pack may read from the 'vortex.load_status' objective.

scoreboard objectives add vortex.load_status dummy
scoreboard players set #vortex.player_action.major vortex.load_status 1
scoreboard players set #vortex.player_action.minor vortex.load_status 7
