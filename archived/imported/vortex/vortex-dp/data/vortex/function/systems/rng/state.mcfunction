# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/rng/state
# Copies the current generator state to vortex:output result, so a
# test can capture it, and vortex:systems/rng/seed can restore it
# later to replay the same sequence.
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{rng:0b} run return 0
execute store result storage vortex:output result int 1 run data get storage vortex:engine rng.state
