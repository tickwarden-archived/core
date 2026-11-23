# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/catalog_prev_button [MACRO]
$function vortex:api/dialog/button {label:{text:"← Previous"},callback:[{type:"function",function:"vortex:api/dialog/catalog_page"}],payload:{page:$(page)}}
