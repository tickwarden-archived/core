# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/geo/region_watch/unregister
# Deletes a registered region. Player state scores are not cleared
# (automatically skipped in the next tick_scan loop).
#
# INPUT (storage vortex:input):
# id → region id
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{geo:0b} run return 0
function vortex:core/internal/systems/geo/region_watch/unregister_exec with storage vortex:input {}
