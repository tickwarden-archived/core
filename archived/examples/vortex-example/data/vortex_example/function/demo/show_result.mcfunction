# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_55b54ff038:lifecycle {phase:1} run return 0
# vortex_example:demo/show_result
# Prints vortex:input_validate result: valid, or the error.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root.

execute if data storage vortex:input_validate result{valid:1b} run tellraw @s {"text":"  -> valid","color":"green"}
execute unless data storage vortex:input_validate result{valid:1b} run tellraw @s ["",{"text":"  -> invalid: ","color":"red"},{"nbt":"result.error","storage":"vortex:input_validate","color":"red"}]
