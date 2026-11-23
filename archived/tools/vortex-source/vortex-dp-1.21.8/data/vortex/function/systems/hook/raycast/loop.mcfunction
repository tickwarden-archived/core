# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# Raycast loop
# Check if there is a non-air block at the current position

# Non-air block found → call found function
execute if data storage vortex:engine modules{hook:0b} run return 0
execute unless block ~ ~ ~ #minecraft:air run return run function vortex:systems/hook/raycast/found

# Still air → continue
# Increment counter
scoreboard players add @s vortex.tmp 1

# Stop if max distance reached (50 steps = 5 blocks)
execute if score @s vortex.tmp matches 50.. run return 0

# Advance position by 0.1 blocks and try again
execute positioned ^ ^ ^0.1 run function vortex:systems/hook/raycast/loop
