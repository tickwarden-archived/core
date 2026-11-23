# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
data remove storage guikit:in menu
data modify storage guikit:in menu set from storage guikit:act w.menu
execute if data storage guikit:act w.to run data modify storage guikit:in menu set from storage guikit:act w.to
execute unless data storage guikit:in menu run return 0
function guikit:api/open
