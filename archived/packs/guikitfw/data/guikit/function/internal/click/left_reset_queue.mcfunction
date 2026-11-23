# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# Rebuild queue for left pass (shift may have consumed it)
function guikit:internal/click/build_queue
