# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# Raycast start
# Reset distance counter (max 50 steps = 5 blocks)
execute if data storage macroengine:engine modules{hook:0b} run return 0
scoreboard players set @s macroengine.tmp 0

# Start loop
function macroengine:systems/hook/raycast/loop
