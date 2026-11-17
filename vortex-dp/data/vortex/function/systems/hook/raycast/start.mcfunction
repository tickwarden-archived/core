# Raycast start
# Reset distance counter (max 50 steps = 5 blocks)
execute if data storage vortex:engine modules{hook:0b} run return 0
scoreboard players set @s vortex.tmp 0

# Start loop
function vortex:systems/hook/raycast/loop
