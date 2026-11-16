# ─────────────────────────────────────────────────────────────────
# vortex:systems/lib/fiber/is_alive
# Checks whether a fiber is active.
#
# INPUT (storage vortex:input):
# id → fiber id
#
# OUTPUT (storage vortex:output):
# result → 1b (active) | 0b (dead or never started)
# ─────────────────────────────────────────────────────────────────

function vortex:core/internal/core/lib/fiber/is_alive_exec with storage vortex:input {}
