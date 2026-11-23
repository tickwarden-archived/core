# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:systems/geo/region_watch/unregister
# Deletes a registered region. Player state scores are not cleared
# (automatically skipped in the next tick_scan loop).
#
# INPUT (storage macroengine:input):
# id → region id
# ─────────────────────────────────────────────────────────────────

execute if data storage macroengine:engine modules{geo:0b} run return 0
function macroengine:core/internal/systems/geo/region_watch/unregister_exec with storage macroengine:input {}
