# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/on_dimension_change
# Advancement reward: runs when changed_dimension triggers.
# @s = player who changed dimension

execute if data storage macroengine:engine modules{hook:0b} run return 0
advancement revoke @s only macroengine:systems/hook/dimension_change
scoreboard players add @s macroengine.hook_dim_changed 1
