# vortex:systems/dbg/trim_err
# Keeps storage vortex:dbg err at 50 entries (drops the oldest).
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.

execute store result score #vortex.dbg_err vortex.tmp run data get storage vortex:dbg err
execute if score #vortex.dbg_err vortex.tmp matches 51.. run data remove storage vortex:dbg err[0]
