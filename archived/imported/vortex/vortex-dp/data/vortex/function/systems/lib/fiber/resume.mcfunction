# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/lib/fiber/resume
# Resumes a fiber immediately (no delay).
# Used to trigger a fiber step externally without yield.
#
# INPUT (storage vortex:input):
# id → fiber id
# func → function to run
# ─────────────────────────────────────────────────────────────────

function vortex:core/internal/core/lib/fiber/resume_exec with storage vortex:input {}
