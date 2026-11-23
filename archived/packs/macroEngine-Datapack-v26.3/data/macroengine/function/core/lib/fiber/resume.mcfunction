# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:core/lib/fiber/resume
# Resumes a fiber immediately (no delay).
# Used to trigger a fiber step externally without yield.
#
# INPUT (storage macroengine:input):
# id → fiber id
# func → function to run
# ─────────────────────────────────────────────────────────────────

function macroengine:core/internal/core/lib/fiber/resume_exec with storage macroengine:input {}
