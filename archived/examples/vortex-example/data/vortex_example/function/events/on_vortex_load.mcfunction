# vortex_example:events/on_vortex_load
# Registered in #vortex:events/on_load (this pack's own
# data/vortex/tags/function/events/on_load.json): Vortex fires that tag
# once at the end of vortex:setup, on every load and /reload, after all of
# its modules finished loading. There is no executor entity here, so this
# writes to storage (dbg) instead of addressing @s; see it in demo/dbg.
# The unless-guard makes the line work even if this pack's load tag runs
# before Vortex created vortex:dbg.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root.

execute unless data storage vortex:dbg out run data modify storage vortex:dbg out set value []
function vortex:systems/dbg/out {src:"vortex_example",msg:"on_load hook: Vortex finished loading"}
