# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# widget/random — reads guikit:draw.w, places icon, optional state
function guikit:widget/_place
