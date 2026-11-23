# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_55b54ff038:lifecycle {phase:1} run return 0
# vortex_example:provider/one
# Provider for api/macro/with_function: writes its output to the pipe.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root.

data modify storage vortex:engine _macro_pipe.msg set value "the pipe works"
