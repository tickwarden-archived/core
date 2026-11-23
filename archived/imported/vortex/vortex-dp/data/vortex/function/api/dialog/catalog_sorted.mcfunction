# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/dialog/catalog_sorted [MACRO]
$data modify storage vortex:dialog_sort model set value {title:$(title),size:$(size),page:$(page),items:$(items)}
$data modify storage vortex:dialog_sort descending set value $(descending)
execute store result score #sort_count vortex.dialog_tmp run data get storage vortex:dialog_sort model.items
execute unless score #sort_count vortex.dialog_tmp matches 0..64 run return 0
execute store result score #sort_desc vortex.dialog_tmp run data get storage vortex:dialog_sort descending
execute unless score #sort_desc vortex.dialog_tmp matches 0..1 run return 0
data modify storage vortex:dialog_sort remaining set from storage vortex:dialog_sort model.items
data modify storage vortex:dialog_sort sorted set value []
function vortex:core/internal/dialog/sort_outer
data modify storage vortex:dialog_catalog model set from storage vortex:dialog_sort model
data modify storage vortex:dialog_catalog model.items set from storage vortex:dialog_sort sorted
function vortex:core/internal/dialog/catalog
