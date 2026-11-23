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
