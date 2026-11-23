# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/player/init_online
# @s = online player
# Called once per online player during load to ensure pid is assigned.
# Uses get_name to fetch the display name, then hands off to init_from_name.

function vortex:api/player/get/name
function vortex:core/internal/player/init_from_name with storage vortex:names temp
