# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/internal/init_online
# @s = online player
# Called once per online player during load to ensure pid is assigned.
# Uses get_name to fetch the display name, then delegates to init_from_nmacroengine.

function macroengine:player/get/name
function macroengine:core/internal/player/init_from_name with storage macroengine:names temp
