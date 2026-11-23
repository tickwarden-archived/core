# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:core/lib/batch/cancel
# Cancels a batch that has not been flushed.
# Items already flushed and queued cannot be cancelled
# (pulling from process_queue is not supported — macroengine design constraint).
#
# INPUT (storage macroengine:input):
# id → batch id
# ─────────────────────────────────────────────────────────────────

function macroengine:core/internal/core/lib/batch/cancel_exec with storage macroengine:input {}
