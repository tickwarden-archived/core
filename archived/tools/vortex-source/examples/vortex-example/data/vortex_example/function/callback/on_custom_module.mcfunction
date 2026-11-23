# vortex_example:callback/on_custom_module
# Registered in #vortex:callback/dispatch. The runner has no per-module tag
# for user modules, so this handler claims only the callbacks whose args
# carry the pack's own module marker (args.mod, set by demo/module).
# AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root.

execute if data storage vortex:callback top{args:{mod:"example"}} run tellraw @a ["",{"text":"[example] custom-module event ","color":"gold"},{"nbt":"top.id","storage":"vortex:callback","color":"yellow"},{"text":" n=","color":"gold"},{"nbt":"top.args.n","storage":"vortex:callback","color":"yellow"}]
