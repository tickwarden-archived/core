# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/wand/unregister
# Removes all wand binds belonging to a specific tag.
#
# INPUT:
#   $(tag) → tag to remove
# ─────────────────────────────────────────────────────────────────

execute unless data storage vortex:engine wand_binds run return 0

data modify storage vortex:engine _wand_unbinds set from storage vortex:engine wand_binds
data modify storage vortex:engine wand_binds set value []
$data modify storage vortex:engine _wand_filter_tag set value "$(tag)"
function vortex:core/internal/api/wand/unbind_filter
data remove storage vortex:engine _wand_unbinds
data remove storage vortex:engine _wand_filter_tag
