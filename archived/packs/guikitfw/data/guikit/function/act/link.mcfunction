# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
data remove storage guikit:work url
data modify storage guikit:work url set from storage guikit:act w.url
execute unless data storage guikit:work url run return 0
function guikit:act/_link_show with storage guikit:work
function guikit:api/close
