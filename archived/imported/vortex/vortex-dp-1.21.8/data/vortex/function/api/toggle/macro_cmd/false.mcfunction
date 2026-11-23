# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/toggle/macro_cmd/false - Disable macro-executed commands: every `$$(cmd)` line
# Caller: vortex.admin tag required.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.

execute unless entity @s[tag=vortex.admin] run return 0

data modify storage vortex:engine config.module_macro_cmd set value 0b
function vortex:core/config/apply

tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"macro_cmd","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"disabled","color":"red"}]
