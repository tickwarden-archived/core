# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/rng/coin_flip [MACRO]
# Flips a fair coin using the seeded generator.
# Output: vortex:output result → 1b (heads) or 0b (tails)
#
# Example: function vortex:systems/rng/coin_flip
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{rng:0b} run return 0
function vortex:systems/rng/chance {percent:50}
