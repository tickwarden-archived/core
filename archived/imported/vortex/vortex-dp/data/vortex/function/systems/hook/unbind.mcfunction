# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/hook/unbind
# Removes all binds belonging to a specific event.
#
# INPUT (storage vortex:input):
# event → event name
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{hook:0b} run return 0
function vortex:core/internal/systems/hook/unbind_exec with storage vortex:input {}
