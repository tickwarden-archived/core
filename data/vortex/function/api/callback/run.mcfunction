# vortex:api/callback/run
# Public entry point of the shared callback runner (the work happens in
# core/internal/callback/run). Not affected by any module toggle or config flag.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.
#
# INPUT (storage vortex:callback in):
#   id      (string)  callback ID, e.g. "mypack:round_won". Stored lower-case: write handlers
#                     with lower-case IDs. Empty IDs and IDs with a quote or backslash are rejected.
#   args    (any)     optional payload, read by handlers from top.args (or stack[-1].args)
#
# HANDLERS live in function tags and compare the ID themselves:
#   #vortex:callback/dispatch        every callback
#       execute if data storage vortex:callback top{id:"mypack:round_won"} run function mypack:on_round_won
#   Handlers only read top / stack[-1]; the runner removes the entry afterwards.
#
# EXAMPLE
#   data modify storage vortex:callback in set value {id:"mypack:round_won",args:{team:"red"}}
#   function vortex:api/callback/run
#
# RETURN 1 when dispatched, 0 when rejected (reason in dbg.err, see systems/dbg/show).

return run function vortex:core/internal/callback/run
