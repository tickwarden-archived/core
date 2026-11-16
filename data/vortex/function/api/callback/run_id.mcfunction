# vortex:api/callback/run_id [MACRO]
# Shortcut for api/callback/run when there is no payload.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.
#
# Usage:  function vortex:api/callback/run_id {id:"mypack:round_won"}
# $(id) is written by the datapack author, not by players: do not pass player input.

$data modify storage vortex:callback in set value {id:"$(id)"}
return run function vortex:core/internal/callback/run
