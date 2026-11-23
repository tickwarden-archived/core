# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(page)
$data modify storage guikit:work on_enter set from storage guikit:draw menu.pages[$(page)].on_enter
