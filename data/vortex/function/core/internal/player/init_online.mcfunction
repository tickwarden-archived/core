# vortex:core/internal/player/init_online
# @s = online player
# Called once per online player during load to ensure pid is assigned.
# Uses get_name to fetch the display name, then delegates to init_from_name.

function vortex:api/player/get/name
function vortex:core/internal/player/init_from_name with storage vortex:names temp
