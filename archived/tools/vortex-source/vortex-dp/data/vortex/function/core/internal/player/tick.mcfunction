# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# Vortex player module — heartbeat.
# Re-schedules itself, then runs the per-player pipeline for everyone online.

schedule function vortex:core/internal/player/tick 1t
execute as @a at @s run function vortex:core/internal/player/player/tick
