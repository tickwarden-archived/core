# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_55b54ff038:lifecycle {phase:1} run return 0
# vortex_example:consumer/print [MACRO]
# Consumer for api/macro/with_function: reads $(msg) from the pipe.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root.

$tellraw @a {"text":"[example] $(msg)","color":"green"}
