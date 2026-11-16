# vortex:core/internal/callback/blocked/cmd [MACRO]
# Called by a guard line when macro_cmd is switched off: instead of dropping the call silently,
# the site is reported as a callback with module "macro_cmd".
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.
#
# $(site) is a constant written by the guard line (a function path), never player input.
# The original macro value is NOT forwarded: it could carry player text, and putting that
# into a macro string is exactly what the toggle exists to stop.
#
# Handler example (listed in #vortex:callback/macro_cmd or #vortex:callback/dispatch):
#   execute if data vortex:callback stack[-1]{id:"vortex:macro_cmd_blocked"} run function mypack:on_blocked
#   (the blocked function path is in vortex:callback stack[-1].site)
#
# RETURN 0: the guarded function still stops, exactly as before.

$data modify storage vortex:callback in set value {id:"vortex:macro_cmd_blocked",module:"macro_cmd",site:"$(site)"}
function vortex:core/internal/callback/run
return 0
