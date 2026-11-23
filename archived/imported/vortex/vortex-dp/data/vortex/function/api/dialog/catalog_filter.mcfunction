# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/catalog_filter [MACRO]
$data modify storage vortex:dialog_filter model set value {title:$(title),size:$(size),page:$(page),items:[]}
$data modify storage vortex:dialog_filter queue set value $(items)
$data modify storage vortex:dialog_filter options set value {query:"$(query)"}
execute store result score #filter_count vortex.dialog_tmp run data get storage vortex:dialog_filter queue
execute unless score #filter_count vortex.dialog_tmp matches 0..64 run return 0
function vortex:core/internal/dialog/filter_collect
data modify storage vortex:dialog_catalog model set from storage vortex:dialog_filter model
return run function vortex:core/internal/dialog/catalog
