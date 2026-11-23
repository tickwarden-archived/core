# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:events/register_once
# Like events/register, but does nothing when the same function is already registered
# for that event. Safe to call from a load function that runs on every /reload.
#
# INPUT  (storage vortex:input events_reg):  event, func   (func = "namespace:path")
# OUTPUT vortex:output result: 1b = registered now, 0b = already there or invalid input
# RETURN 1 when registered, 0 otherwise.
#
# event is checked with systems/validate/safe_name and func with
# systems/validate/function_id before either reaches a macro line.
#
# Usage:
#   data modify storage vortex:input events_reg set value {event:"on_shop_open",func:"mypack:shop/open"}
#   function vortex:events/register_once
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

return run function vortex:core/internal/ext/events/register_once with storage vortex:input events_reg
