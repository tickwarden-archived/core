# vortex_example:callback/on_module_hello
# Registered in #vortex:callback/macro_cmd: runs for every callback whose
# module is "macro_cmd" (including the blocked-macro reports), before the
# shared #vortex:callback/dispatch tag. It filters on its own ID and reads
# the payload from top.args.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root.

execute if data storage vortex:callback top{id:"vortex_example:module_hello"} run tellraw @a ["",{"text":"[example] module callback (macro_cmd tag) from ","color":"gold"},{"nbt":"top.args.from","storage":"vortex:callback","color":"yellow"}]
