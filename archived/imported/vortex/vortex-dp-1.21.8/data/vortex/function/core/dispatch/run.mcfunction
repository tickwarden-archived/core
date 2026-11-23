# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:core/dispatch/run
# Central function dispatch hub — called via #vortex:internal/dispatch.
# Reads func from vortex:engine._dispatch and calls exec via vortex.
#
# Override #vortex:internal/dispatch in your overlay/pack to inject
# validation or logging without touching call sites.
# ─────────────────────────────────────────────────────────────────
function vortex:core/dispatch/exec with storage vortex:engine _dispatch
