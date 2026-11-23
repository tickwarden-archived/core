# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/state/reset_score
# Resets a player's state to 0 (idle).
# Usage: /function macroengine:core/state/reset_score
scoreboard players set @s macroengine.state 0
