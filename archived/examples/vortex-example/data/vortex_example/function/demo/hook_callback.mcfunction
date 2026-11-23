# vortex_example:demo/hook_callback
# Hook + callback: how processing bound through vortex:systems/hook still
# runs when macro_function is OFF (macro off = the callback is the
# default path). The demo drives the same dispatch entry the hook module
# itself uses (#vortex:internal/dispatch, with the target in
# vortex:engine _dispatch.func - the exact state hook/exec leaves
# behind), once with the toggle on and once with it off. In a real world
# the player_death bind from hook/register feeds this same chain.
# Needs vortex.admin (the toggle functions check it).
# AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root.

tellraw @s {"text":"[example] 5/6 hook + callback (macro off = callback default)","color":"aqua","bold":true}
function vortex_example:hook/register

# Path 1 - macro_function ON: dispatch runs the bound function directly.
function vortex:api/toggle/macro_function/true
data modify storage vortex:engine _dispatch.func set value "vortex_example:hook/on_death_work"
function #vortex:internal/dispatch

# Path 2 - macro_function OFF: dispatch does not run it. The
# vortex:macro_function_blocked callback fires instead, and
# callback/hook_blocked whitelist-calls the same function.
function vortex:api/toggle/macro_function/false
data modify storage vortex:engine _dispatch.func set value "vortex_example:hook/on_death_work"
function #vortex:internal/dispatch

function vortex:api/toggle/macro_function/true
