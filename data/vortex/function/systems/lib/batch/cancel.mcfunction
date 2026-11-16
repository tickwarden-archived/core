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
