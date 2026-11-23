# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/lib/batch/begin
# Starts a new batch or clears an existing one.
#
# INPUT (storage vortex:input):
# id → batch id
# spread_over → how many ticks to spread over (default: 1)
# ─────────────────────────────────────────────────────────────────

function vortex:core/internal/core/lib/batch/begin_exec with storage vortex:input {}
