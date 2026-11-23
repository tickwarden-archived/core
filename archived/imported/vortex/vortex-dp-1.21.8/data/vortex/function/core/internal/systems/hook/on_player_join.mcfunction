# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/hook/on_player_join
# @s = the triggering player
data modify storage vortex:engine _hook_fire_tmp set value {event:"player_join"}
function vortex:core/internal/systems/hook/fire with storage vortex:engine _hook_fire_tmp
data remove storage vortex:engine _hook_fire_tmp

# Event bus
function #vortex:events/on_join

# Initialize player data and assign vortex.pid
# get_name populates vortex:names temp.NAME; init_from_name relays it to player/init
function vortex:api/player/get/name
function vortex:core/internal/player/init_from_name with storage vortex:names temp
