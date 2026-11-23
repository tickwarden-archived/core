# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/tui/header - title bar for @s, same look as api/toggle/show
#
# INPUT vortex:tui in:  text (string with %tokens%, required), args (optional)
# RETURN 1 when sent, 0 otherwise.
function vortex:core/internal/tui/render_text
execute unless data storage vortex:tui t run return 0
tellraw @s ["",{"text":"═══════ ","color":"dark_gray"},{"storage":"vortex:tui","nbt":"t","interpret":true,"plain":false,"color":"aqua","bold":true},{"text":" ═══════","color":"dark_gray"}]
return 1
