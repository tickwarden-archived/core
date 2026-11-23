# Vortex player module — heartbeat.
# Re-schedules itself, then runs the per-player pipeline for everyone online.

schedule function vortex:core/internal/player/tick 1t
execute as @a at @s run function vortex:core/internal/player/player/tick
