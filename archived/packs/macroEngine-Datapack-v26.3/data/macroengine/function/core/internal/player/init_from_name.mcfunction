# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:player/internal/init_from_name [MACRO]
# Relay: storage macroengine:names temp {NAME:"<player>"} → macroengine:player/init
# Called by on_player_join after macroengine:player/get/name populates macroengine:names temp.
# Bridges the NAME key to the player key expected by player/init.

$data modify storage macroengine:engine _pid_init_tmp set value {player:"$(NAME)"}
function macroengine:player/init with storage macroengine:engine _pid_init_tmp
data remove storage macroengine:engine _pid_init_tmp
