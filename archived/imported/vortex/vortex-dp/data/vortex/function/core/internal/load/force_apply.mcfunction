# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/load/force_apply
# Actually performs the force re-init: drops the loaded flag and
# re-runs the full init pipeline, discarding any live engine state
# that vortex:core/internal/load/all's "unless data" guards would otherwise preserve.

data remove storage vortex:engine global.loaded
function vortex:core/internal/load/all
