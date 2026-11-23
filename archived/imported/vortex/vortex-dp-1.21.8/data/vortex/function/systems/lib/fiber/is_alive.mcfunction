# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
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
