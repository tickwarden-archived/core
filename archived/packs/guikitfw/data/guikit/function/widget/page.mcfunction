# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# alias of nav (guikit legacy name)
data modify storage guikit:draw w.kind set value "nav"
function guikit:widget/_place
