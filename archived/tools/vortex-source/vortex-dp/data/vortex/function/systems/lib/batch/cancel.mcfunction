# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/lib/batch/cancel
# Cancels a batch that has not been flushed.
# Items already flushed and queued cannot be cancelled
# (pulling from process_queue is not supported — vortex design constraint).
#
# INPUT (storage vortex:input):
# id → batch id
# ─────────────────────────────────────────────────────────────────

function vortex:core/internal/core/lib/batch/cancel_exec with storage vortex:input {}
