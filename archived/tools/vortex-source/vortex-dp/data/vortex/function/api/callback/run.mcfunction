# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/callback/run
# Public entry point of the shared callback runner (the work happens in
# core/internal/callback/run). Not affected by any module toggle or config flag.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.
#
# INPUT (storage vortex:callback in):
#   id      (string)  callback ID, e.g. "mypack:round_won". Stored lower-case: write handlers
#                     with lower-case IDs. Empty IDs and IDs with a quote or backslash are rejected.
#   module  (string)  optional "macro_cmd" or "macro_function": also runs that module's tag
#   args    (any)     optional payload, read by handlers from top.args (or stack[-1].args)
#
# HANDLERS live in function tags and compare the ID themselves:
#   #vortex:callback/dispatch        every callback
#   #vortex:callback/macro_cmd       module "macro_cmd"      (fired when $$(cmd) is switched off)
#   #vortex:callback/macro_function  module "macro_function" (fired when $function $(id) is switched off)
#       execute if data storage vortex:callback top{id:"mypack:round_won"} run function mypack:on_round_won
#   Handlers only read top / stack[-1]; the runner removes the entry afterwards.
#
# EXAMPLE
#   data modify storage vortex:callback in set value {id:"mypack:round_won",args:{team:"red"}}
#   function vortex:api/callback/run
#
# RETURN 1 when dispatched, 0 when rejected (reason in dbg.err, see systems/dbg/show).

return run function vortex:core/internal/callback/run
