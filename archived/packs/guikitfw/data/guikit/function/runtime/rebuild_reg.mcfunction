# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# Mirror lib → reg (bare keys). Other packs can also listen on #guikit:register.
data modify storage guikit:reg menus set from storage guikit:lib menus
function #guikit:register
