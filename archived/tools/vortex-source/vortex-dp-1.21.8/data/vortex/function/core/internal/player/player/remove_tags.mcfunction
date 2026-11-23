# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# Vortex player module — drop all state tags before this tick's
# detection runs. Tags are re-added below when their condition holds.

tag @s remove vortex.player_action.moving

# Movement-state tags
tag @s remove vortex.player_action.flying
tag @s remove vortex.player_action.walking
tag @s remove vortex.player_action.falling
tag @s remove vortex.player_action.climbing
tag @s remove vortex.player_action.elyra_flying
tag @s remove vortex.player_action.swimming
tag @s remove vortex.player_action.sneaking
tag @s remove vortex.player_action.sprinting

# Mount tags
tag @s remove vortex.player_action.riding_pig
tag @s remove vortex.player_action.riding_boat
tag @s remove vortex.player_action.riding_mule
tag @s remove vortex.player_action.riding_llama
tag @s remove vortex.player_action.riding_horse
tag @s remove vortex.player_action.riding_donkey
tag @s remove vortex.player_action.riding_strider
tag @s remove vortex.player_action.riding_minecart
