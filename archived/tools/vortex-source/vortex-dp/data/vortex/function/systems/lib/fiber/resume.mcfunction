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
