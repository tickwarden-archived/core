# ─────────────────────────────────────────────────────────────────
# vortex:systems/lib/fiber/kill
# Stops a fiber. Pending resumes in the queue will not run.
#
# INPUT (storage vortex:input):
# id → fiber id
# ─────────────────────────────────────────────────────────────────

function vortex:core/internal/core/lib/fiber/kill_exec with storage vortex:input {}
