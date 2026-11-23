# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/load/force
# Force reload: applies immediately. Discards live
# engine state (global.loaded and everything load/all's "unless data"
# guards would otherwise preserve).

function vortex:core/internal/load/force_apply
