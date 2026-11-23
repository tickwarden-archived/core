# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_55b54ff038:lifecycle {phase:1} run return 0
# vortex_example:hook/register
# Binds the example's processing function to the player_death hook, once.
# Hook binds live in storage (vortex:engine hook_binds) and survive
# /reload, so binding on every load would stack duplicates; the flag in
# this pack's own storage makes registration one-shot. Called from setup.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root.

execute if data storage vortex_example:data {hooks_v1:1b} run return 0

data modify storage vortex:input event set value "player_death"
data modify storage vortex:input func set value "vortex_example:hook/on_death_work"
function vortex:systems/hook/bind
data modify storage vortex_example:data hooks_v1 set value 1b
