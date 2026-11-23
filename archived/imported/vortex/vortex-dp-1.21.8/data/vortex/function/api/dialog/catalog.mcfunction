# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/catalog [MACRO]
$data modify storage vortex:dialog_catalog model set value {title:$(title),items:$(items),size:$(size),page:$(page)}
function vortex:core/internal/dialog/catalog
