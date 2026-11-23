# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:api/player/var/toggle
# Flips a boolean player variable: 0 / missing -> 1b, anything else -> 0b.
#
# INPUT  (storage vortex:input pvar):  player, key
# OUTPUT vortex:output result: the new value (1b / 0b)
# RETURN 1 when the new value is 1b, 0 when it is 0b or the input is invalid.
#
# Same storage as player/var/get|set. player and key are checked with
# systems/validate/safe_name before any macro line.
#
# Usage:
#   data modify storage vortex:input pvar set value {player:"Steve",key:"pvp"}
#   function vortex:api/player/var/toggle
# ======================================================================================

execute unless data storage vortex:input pvar.player run return 0
execute unless data storage vortex:input pvar.key run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:input pvar.player
execute unless function vortex:systems/validate/safe_name run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:input pvar.key
execute unless function vortex:systems/validate/safe_name run return 0

return run function vortex:core/internal/ext/player/toggle_var with storage vortex:input pvar
