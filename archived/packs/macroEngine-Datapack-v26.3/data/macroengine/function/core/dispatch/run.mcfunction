# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:core/dispatch/run
# Central function dispatch gateway — called via #macroengine:internal/dispatch.
# Reads func from macroengine:engine._dispatch and calls exec via macroengine.
#
# Override #macroengine:internal/dispatch in your overlay/pack to inject
# validation or logging without touching call sites.
# ─────────────────────────────────────────────────────────────────
function macroengine:core/dispatch/exec with storage macroengine:engine _dispatch
