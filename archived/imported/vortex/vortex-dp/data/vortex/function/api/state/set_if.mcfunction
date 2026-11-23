# ======================================================================================
# vortex:api/state/set_if
# Compare-and-set for a player state: change the state to <to> only while it is still <from>.
# A safe building block for state machines (idle -> casting -> cooldown) because two
# systems cannot both win the same transition.
#
# INPUT  (storage vortex:input state):  player, from, to
# OUTPUT vortex:output result: 1b = changed, 0b = not changed (or invalid input)
# RETURN 1 when changed, 0 otherwise.
#
# Reads/writes the same storage as core/state/set|get|is. All three values are checked with
# systems/validate/safe_name before they reach a macro line.
#
# Usage:
#   data modify storage vortex:input state set value {player:"Steve",from:"idle",to:"casting"}
#   execute if function vortex:api/state/set_if run say started
# ======================================================================================

data modify storage vortex:output result set value 0b
execute unless data storage vortex:input state.player run return 0
execute unless data storage vortex:input state.from run return 0
execute unless data storage vortex:input state.to run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:input state.player
execute unless function vortex:systems/validate/safe_name run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:input state.from
execute unless function vortex:systems/validate/safe_name run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:input state.to
execute unless function vortex:systems/validate/safe_name run return 0

return run function vortex:core/internal/ext/state/set_if with storage vortex:input state
