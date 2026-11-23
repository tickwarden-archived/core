# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# Dispatch widget kind → widget/<kind> place + record action if interactive
data modify storage guikit:work kind set from storage guikit:draw w.kind
function guikit:internal/draw/one_kind with storage guikit:work
