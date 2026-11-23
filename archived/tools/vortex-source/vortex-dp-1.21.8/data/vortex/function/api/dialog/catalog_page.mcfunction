# vortex:api/dialog/catalog_page [MACRO]
function vortex:core/internal/dialog/context
function vortex:core/internal/dialog/catalog_load with storage vortex:dialog_ctx
$data modify storage vortex:dialog_catalog model.page set value $(page)
function vortex:core/internal/dialog/catalog
