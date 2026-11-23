# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroEngine player module — heartbeat.
# Re-schedules itself, then runs the per-player pipeline for everyone online.

schedule function macroengine:core/internal/player/tick 1t
execute as @a at @s run function macroengine:core/internal/player/player/tick
