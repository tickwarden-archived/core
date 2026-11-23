# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/dbg/clear
# Empties dbg.out and dbg.err. Caller: vortex.admin tag required.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.

execute unless entity @s[tag=vortex.admin] run return 0
data remove storage vortex:dbg out
data remove storage vortex:dbg err
