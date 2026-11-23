# vortex_example:hook/on_death_work
# The processing bound to the player_death hook (see hook/register).
# With macro_function ON it runs directly through core/dispatch/exec;
# with macro_function OFF it does not run there - callback/hook_blocked
# whitelist-calls this same function from the blocked callback instead.
# @s is the triggering player in both paths.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root.

tellraw @a ["",{"text":"[example] hook work ran (player_death processing) for ","color":"gold"},{"selector":"@s","color":"yellow"}]
