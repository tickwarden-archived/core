# vortex:api/toggle/macro_cmd/true - Enable macro-executed commands: every `$$(cmd)` line
# Caller: vortex.admin tag required.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.

execute unless entity @s[tag=vortex.admin] run return 0

data modify storage vortex:engine config.module_macro_cmd set value 1b
function vortex:core/config/apply

tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"macro_cmd","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"enabled","color":"green"}]
