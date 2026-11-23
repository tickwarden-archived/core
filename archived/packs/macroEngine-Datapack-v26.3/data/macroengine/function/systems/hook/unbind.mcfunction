# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:systems/hook/unbind
# Removes all binds belonging to a specific event.
#
# INPUT (storage macroengine:input):
# event → event name
# ─────────────────────────────────────────────────────────────────

execute if data storage macroengine:engine modules{hook:0b} run return 0
function macroengine:core/internal/systems/hook/unbind_exec with storage macroengine:input {}
