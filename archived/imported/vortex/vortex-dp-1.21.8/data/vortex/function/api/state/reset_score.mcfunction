# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/state/reset_score
# Resets a player's state to 0 (idle).
# Usage: /function vortex:api/state/reset_score
scoreboard players set @s vortex.state 0
