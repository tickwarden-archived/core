# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/catalog_next_button [MACRO]
$function vortex:api/dialog/button {label:{text:"Next →"},callback:[{type:"function",function:"vortex:api/dialog/catalog_page"}],payload:{page:$(page)}}
