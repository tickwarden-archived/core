# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
execute unless data storage guikit:act w.functions[0] run return 0
data modify storage guikit:work fn set from storage guikit:act w.functions[0]
function guikit:act/_functions_one with storage guikit:work
data remove storage guikit:act w.functions[0]
function guikit:act/_functions
