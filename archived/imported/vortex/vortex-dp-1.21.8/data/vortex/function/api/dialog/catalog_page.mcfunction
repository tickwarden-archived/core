# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/catalog_page [MACRO]
function vortex:core/internal/dialog/context
function vortex:core/internal/dialog/catalog_load with storage vortex:dialog_ctx
$data modify storage vortex:dialog_catalog model.page set value $(page)
function vortex:core/internal/dialog/catalog
