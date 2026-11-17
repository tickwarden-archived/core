# vortex:systems/dbg/trim_out
# Keeps storage vortex:dbg out at 50 entries (drops the oldest).
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.

execute store result score #vortex.dbg_out vortex.tmp run data get storage vortex:dbg out
execute if score #vortex.dbg_out vortex.tmp matches 51.. run data remove storage vortex:dbg out[0]
