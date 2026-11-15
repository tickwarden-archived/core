# vortex:api/callback/run
# Shared callback runner. Any module or datapack can call it; it has no module toggle
# and no config flag, so it cannot be switched off (unlike api/cb/*, hook, macro_*).
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.
#
# INPUT (storage vortex:callback in):
#   id    (string)  - callback ID, e.g. "mypack:round_won"   [REQUIRED]
#   args  (any)     - optional payload, read by handlers from stack[-1].args
#
# HOW IT WORKS
#   1. in is pushed onto storage vortex:callback stack and in is removed.
#   2. The function tag #vortex:callback/dispatch runs. Every function listed in that tag is
#      a handler that COMPARES the ID itself and runs its action only on a match:
#          execute if data storage vortex:callback stack[-1]{id:"mypack:round_won"} run function mypack:on_round_won
#   3. stack[-1] is removed again, so the storage is clean when the runner returns.
#
# The stack makes the runner re-entrant: a handler may call api/callback/run itself; the
# outer handlers still see their own entry at stack[-1] afterwards.
#
# Handlers must only READ stack[-1] and must not remove it.
#
# EXAMPLE
#   data modify storage vortex:callback in set value {id:"mypack:round_won",args:{team:"red"}}
#   function vortex:api/callback/run
#
# RETURN 1 when the dispatch ran, 0 when no id was given.

execute unless data storage vortex:callback in.id run function vortex:systems/dbg/err {src:"callback",msg:"callback in.id not set"}
execute unless data storage vortex:callback in.id run return 0

data modify storage vortex:callback stack append from storage vortex:callback in
data remove storage vortex:callback in

function #vortex:callback/dispatch

data remove storage vortex:callback stack[-1]
return 1
