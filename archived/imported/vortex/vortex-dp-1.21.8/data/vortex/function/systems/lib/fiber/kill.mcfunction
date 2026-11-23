# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/lib/fiber/kill
# Stops a fiber. Pending resumes in the queue will not run.
#
# INPUT (storage vortex:input):
# id → fiber id
# ─────────────────────────────────────────────────────────────────

function vortex:core/internal/core/lib/fiber/kill_exec with storage vortex:input {}
