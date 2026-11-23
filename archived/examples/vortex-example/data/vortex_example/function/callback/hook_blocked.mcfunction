# vortex_example:callback/hook_blocked
# Registered in #vortex:callback/macro_function. This is how processing
# bound through the hook module still happens when macro_function is OFF:
# core/dispatch/exec does not run the bound function, it fires the
# vortex:macro_function_blocked callback instead (the default fallback),
# and the intended target is still in vortex:engine _dispatch.func.
# The site check keeps this handler to dispatch-sourced blocks only.
# The target cannot be re-run with $function (that is what the toggle
# stops), so known targets are matched by name and called with fixed
# function lines - whitelist dispatch. Unknown targets simply do not run.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root.

execute unless data storage vortex:callback top{id:"vortex:macro_function_blocked",site:"core/dispatch/exec"} run return 0
execute if data storage vortex:engine _dispatch{func:"vortex_example:hook/on_death_work"} run function vortex_example:hook/on_death_work
