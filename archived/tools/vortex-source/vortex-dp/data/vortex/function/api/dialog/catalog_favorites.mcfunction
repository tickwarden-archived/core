# vortex:api/dialog/catalog_favorites [MACRO]
$data modify storage vortex:dialog_filter model set value {title:$(title),size:$(size),page:$(page),items:[]}
function vortex:core/internal/dialog/context
function vortex:core/internal/dialog/favorites_read with storage vortex:dialog_ctx
function vortex:core/internal/dialog/favorites_collect
data modify storage vortex:dialog_catalog model set from storage vortex:dialog_filter model
return run function vortex:core/internal/dialog/catalog
