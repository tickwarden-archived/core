# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/lib/fiber/yield
# Exits a fiber step and queues the next step.
# Checks if the fiber is dead — no resume after kill.
#
# INPUT (storage vortex:input):
# id → fiber id
# resume → function name of the next step
# delay → how many ticks to wait before resuming (default: 1)
#
# CALL SITE: called at the end of a fiber step function.
# ─────────────────────────────────────────────────────────────────

function vortex:core/internal/core/lib/fiber/yield_exec with storage vortex:input {}
