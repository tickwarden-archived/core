# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:events/has_func
# Checks whether one specific function is registered for an event (events/has only says
# whether the event has any handler at all).
#
# INPUT  (storage vortex:input events_reg):  event, func
# OUTPUT vortex:output result: 1b / 0b
# RETURN 1 when registered, 0 otherwise (also 0 for invalid input).
#
# Usage:
#   data modify storage vortex:input events_reg set value {event:"on_shop_open",func:"mypack:shop/open"}
#   execute if function vortex:events/has_func run say registered
# ======================================================================================

data modify storage vortex:output result set value 0b
execute unless data storage vortex:input events_reg.event run return 0
execute unless data storage vortex:input events_reg.func run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:input events_reg.event
execute unless function vortex:systems/validate/safe_name run return 0
data remove storage vortex:validate in
data modify storage vortex:validate in.value set from storage vortex:input events_reg.func
execute unless function vortex:systems/validate/function_id run return 0

return run function vortex:core/internal/ext/events/has_func with storage vortex:input events_reg
