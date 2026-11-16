# vortex:core/internal/player/init_from_name [MACRO]
# Relay: storage vortex:names temp {NAME:"<player>"} → vortex:api/player/init
# Called by on_player_join after vortex:api/player/get/name populates vortex:names temp.
# Bridges the NAME key to the player key expected by player/init.

$data modify storage vortex:engine _pid_init_tmp set value {player:"$(NAME)"}
function vortex:api/player/init with storage vortex:engine _pid_init_tmp
data remove storage vortex:engine _pid_init_tmp
