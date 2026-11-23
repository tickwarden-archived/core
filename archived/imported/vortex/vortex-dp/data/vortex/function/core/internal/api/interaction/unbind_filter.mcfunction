# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/interaction/unbind_filter
execute unless data storage vortex:engine _ia_ubinds[0] run return 0

data modify storage vortex:engine _ia_ucur set from storage vortex:engine _ia_ubinds[0]
data remove storage vortex:engine _ia_ubinds[0]

function vortex:core/internal/api/interaction/unbind_check with storage vortex:engine _ia_ufilter

function vortex:core/internal/api/interaction/unbind_filter
data remove storage vortex:engine _ia_ucur
