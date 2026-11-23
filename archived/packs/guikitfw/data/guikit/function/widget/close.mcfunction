# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
data modify storage guikit:draw w.kind set value "close"
execute unless data storage guikit:draw w.id run data modify storage guikit:draw w.id set value "close"
function guikit:widget/_place
