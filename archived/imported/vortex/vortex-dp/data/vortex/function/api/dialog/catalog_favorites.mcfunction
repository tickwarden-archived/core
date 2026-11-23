# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/catalog_favorites [MACRO]
$data modify storage vortex:dialog_filter model set value {title:$(title),size:$(size),page:$(page),items:[]}
function vortex:core/internal/dialog/context
function vortex:core/internal/dialog/favorites_read with storage vortex:dialog_ctx
function vortex:core/internal/dialog/favorites_collect
data modify storage vortex:dialog_catalog model set from storage vortex:dialog_filter model
return run function vortex:core/internal/dialog/catalog
