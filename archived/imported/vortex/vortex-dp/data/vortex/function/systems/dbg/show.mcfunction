# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/dbg/show
# Prints dbg.out and dbg.err to @s on request (this is the only place they reach chat).
# Caller: vortex.admin tag required.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.

execute unless entity @s[tag=vortex.admin] run return 0

tellraw @s ["",{"text":"[VORTEX/dbg] ","color":"#00AAAA","bold":true},{"text":"err:","color":"red"}]
execute unless data storage vortex:dbg err[0] run tellraw @s {"text":" (none)","color":"#555555"}
execute if data storage vortex:dbg err[0] run tellraw @s ["",{"text":" ","color":"#555555"},{"plain":true,"storage":"vortex:dbg","nbt":"err","interpret":false,"color":"red"}]
tellraw @s ["",{"text":"[VORTEX/dbg] ","color":"#00AAAA","bold":true},{"text":"out:","color":"gray"}]
execute unless data storage vortex:dbg out[0] run tellraw @s {"text":" (none)","color":"#555555"}
execute if data storage vortex:dbg out[0] run tellraw @s ["",{"text":" ","color":"#555555"},{"plain":true,"storage":"vortex:dbg","nbt":"out","interpret":false,"color":"white"}]
