# vortex:tui/header - title bar for @s, same look as api/toggle/show
#
# INPUT vortex:tui in:  text (string with %tokens%, required), args (optional)
# RETURN 1 when sent, 0 otherwise.
function vortex:core/internal/tui/render_text
execute unless data storage vortex:tui t run return 0
tellraw @s ["",{"text":"═══════ ","color":"dark_gray"},{"storage":"vortex:tui","nbt":"t","interpret":true,"plain":false,"color":"aqua","bold":true},{"text":" ═══════","color":"dark_gray"}]
return 1
