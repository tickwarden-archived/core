# ─────────────────────────────────────────────────────────────────
# vortex:systems/rng/state
# Copies the current generator state to vortex:output result, so a
# test can capture it, and vortex:systems/rng/seed can restore it
# later to replay the same sequence.
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{rng:0b} run return 0
execute store result storage vortex:output result int 1 run data get storage vortex:engine rng.state
