# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# Advancement reward: runs when placed_block triggers
# Find the newly placed block in the direction the player is looking

# Revoke advancement (so it can trigger again)
execute if data storage vortex:engine modules{hook:0b} run return 0
advancement revoke @s only vortex:systems/hook/placed_block

# Start raycast: begin from player's eyes
execute as @s at @s anchored eyes run function vortex:systems/hook/raycast/start
