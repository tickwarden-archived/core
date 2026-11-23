# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/wand/unregister
# Removes all wand binds belonging to a specific tag.
#
# INPUT (storage vortex:input):
# tag → wand tag to remove
#
# EXAMPLE:
# data modify storage vortex:input tag set value "fire_wand"
# function vortex:api/wand/unregister
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{wand:0b} run return 0
function vortex:core/internal/api/wand/unregister_exec with storage vortex:input {}
