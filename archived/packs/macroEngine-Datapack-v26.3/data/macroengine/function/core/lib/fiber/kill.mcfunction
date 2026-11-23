# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:core/lib/fiber/kill
# Stops a fiber. Pending resumes in the queue will not run.
#
# INPUT (storage macroengine:input):
# id → fiber id
# ─────────────────────────────────────────────────────────────────

function macroengine:core/internal/core/lib/fiber/kill_exec with storage macroengine:input {}
