# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/hook/on_fish_caught
# @s = the fishing player
scoreboard players add @s vortex.hook_fish 1
advancement revoke @s only vortex:systems/hook/fish_caught
