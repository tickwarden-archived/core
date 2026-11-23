# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_55b54ff038:lifecycle {phase:1} run return 0
# vortex_example:demo/dbg
# dbg.out / dbg.err write to storage instead of chat; show prints them on request.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md in the repo root.

tellraw @s {"text":"[example] 6/6 dbg","color":"aqua","bold":true}
function vortex:systems/dbg/out {src:"vortex_example",msg:"hello from the example pack"}
function vortex:systems/dbg/err {src:"vortex_example",msg:"sample error line"}
function vortex:systems/dbg/show
