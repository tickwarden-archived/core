# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:core/lib/batch/begin
# Starts a new batch or clears an existing one.
#
# INPUT (storage macroengine:input):
# id → batch id
# spread_over → how many ticks to spread over (default: 1)
# ─────────────────────────────────────────────────────────────────

function macroengine:core/internal/core/lib/batch/begin_exec with storage macroengine:input {}
