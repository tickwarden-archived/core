# ─────────────────────────────────────────────────────────────────
# vortex:systems/lib/batch/flush
# Splits batch jobs across spread_over ticks and adds them to process_queue.
# Jobs per tick: ceil(items / spread_over).
# Batch record is deleted after flush.
#
# INPUT (storage vortex:input):
# id → batch id
# ─────────────────────────────────────────────────────────────────

function vortex:core/internal/core/lib/batch/flush_exec with storage vortex:input {}
