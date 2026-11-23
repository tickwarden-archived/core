# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/catalog_reopen
function vortex:core/internal/dialog/context
function vortex:core/internal/dialog/catalog_load with storage vortex:dialog_ctx
function vortex:core/internal/dialog/catalog
