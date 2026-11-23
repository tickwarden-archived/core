# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# Raycast start
# Reset distance counter (max 50 steps = 5 blocks)
execute if data storage vortex:engine modules{hook:0b} run return 0
scoreboard players set @s vortex.tmp 0

# Start loop
function vortex:systems/hook/raycast/loop
