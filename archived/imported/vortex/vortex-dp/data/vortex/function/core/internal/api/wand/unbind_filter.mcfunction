# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/wand/unbind_filter
# Write back entries from _wand_unbinds that do not match _wand_filter_tag.

execute unless data storage vortex:engine _wand_unbinds[0] run return 0

data modify storage vortex:engine _wand_cur set from storage vortex:engine _wand_unbinds[0]
data remove storage vortex:engine _wand_unbinds[0]

function vortex:core/internal/api/wand/unbind_check with storage vortex:engine _wand_cur

function vortex:core/internal/api/wand/unbind_filter
data remove storage vortex:engine _wand_cur
