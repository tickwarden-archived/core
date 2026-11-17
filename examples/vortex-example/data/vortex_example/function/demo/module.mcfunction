# vortex_example:demo/module
# Module-specific callbacks. Setting `module` on the callback makes the
# runner fire that module's tag before the shared #vortex:callback/dispatch.
# Only two module tags exist ("macro_cmd", "macro_function"); for your own
# modules, mark `args` and let handlers filter on it (second call below).
# AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root.

tellraw @s {"text":"[example] 4/5 module callbacks","color":"aqua","bold":true}

# 1) built-in module: handler vortex_example:callback/on_module_hello is
#    registered in #vortex:callback/macro_cmd and runs before dispatch.
data modify storage vortex:callback in set value {id:"vortex_example:module_hello",module:"macro_cmd",args:{from:"demo/module"}}
function vortex:api/callback/run

# 2) own module: there is no #vortex:callback/<your module> tag, so the
#    module marker travels in args and the dispatch handler filters on it.
data modify storage vortex:callback in set value {id:"vortex_example:custom_event",args:{mod:"example",n:7}}
function vortex:api/callback/run
