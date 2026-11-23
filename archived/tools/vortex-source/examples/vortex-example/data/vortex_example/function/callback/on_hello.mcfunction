# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_55b54ff038:lifecycle {phase:1} run return 0
# vortex_example:callback/on_hello
# AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root.

execute if data storage vortex:callback stack[-1].args.team run tellraw @a ["",{"text":"[example] hello, team ","color":"green"},{"nbt":"stack[-1].args.team","storage":"vortex:callback","color":"yellow"}]
execute unless data storage vortex:callback stack[-1].args.team run tellraw @a {"text":"[example] hello (no payload)","color":"green"}
