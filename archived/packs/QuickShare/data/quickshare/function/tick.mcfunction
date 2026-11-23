# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_67654ba1d3:lifecycle {phase:1} run return 0
# Ticks down each player's cooldown, floored at 0
execute as @a[scores={qs_cooldown=1..}] run scoreboard players remove @s qs_cooldown 1
