# vortex:systems/dbg/clear
# Empties dbg.out and dbg.err. Caller: vortex.admin tag required.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.

execute unless entity @s[tag=vortex.admin] run return 0
data remove storage vortex:dbg out
data remove storage vortex:dbg err
