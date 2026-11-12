# ─────────────────────────────────────────────────────────────────
# vortex:systems/rng/coin_flip [MACRO]
# Flips a fair coin using the seeded generator.
# Output: vortex:output result → 1b (heads) or 0b (tails)
#
# Example: function vortex:systems/rng/coin_flip
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{rng:0b} run return 0
function vortex:systems/rng/chance {percent:50}
