# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/on_entity_kill
# Reward: entity_kill advancement (player_killed_entity trigger)
execute if data storage macroengine:engine modules{hook:0b} run return 0
advancement revoke @s only macroengine:systems/hook/entity_kill
scoreboard players add @s macroengine.hook_entity_killed 1
