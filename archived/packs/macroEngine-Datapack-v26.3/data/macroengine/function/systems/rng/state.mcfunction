# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:systems/rng/state
# Copies the current generator state to macroengine:output result, so a
# test can capture it, and macroengine:systems/rng/seed can restore it
# later to replay the same sequence.
# ─────────────────────────────────────────────────────────────────

execute if data storage macroengine:engine modules{rng:0b} run return 0
execute store result storage macroengine:output result int 1 run data get storage macroengine:engine rng.state
