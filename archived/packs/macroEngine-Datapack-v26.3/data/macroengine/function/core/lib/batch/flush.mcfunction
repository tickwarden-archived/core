# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:core/lib/batch/flush
# Splits batch jobs across spread_over ticks and adds them to process_queue.
# Jobs per tick: ceil(items / spread_over).
# Batch record is deleted after flush.
#
# INPUT (storage macroengine:input):
# id → batch id
# ─────────────────────────────────────────────────────────────────

function macroengine:core/internal/core/lib/batch/flush_exec with storage macroengine:input {}
