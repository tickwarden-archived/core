# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/internal/on_fish_caught
# @s = the fishing player
scoreboard players add @s macroengine.hook_fish 1
advancement revoke @s only macroengine:systems/hook/fish_caught
