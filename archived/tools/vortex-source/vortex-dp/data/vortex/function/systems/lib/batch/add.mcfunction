# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/lib/batch/add
# Adds a job to the batch queue.
#
# INPUT (storage vortex:input):
# id → batch id
# func → function to run (opsiyonel)
# cmd → command to run (optional, used if no func)
# ─────────────────────────────────────────────────────────────────

function vortex:core/internal/core/lib/batch/add_exec with storage vortex:input {}
