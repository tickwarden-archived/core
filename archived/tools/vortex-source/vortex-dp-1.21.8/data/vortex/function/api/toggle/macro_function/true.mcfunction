# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/toggle/macro_function/true - Enable macro-called function IDs: every `$function $(id)` line
# Caller: vortex.admin tag required.
# AI-assisted: written with Claude (Anthropic); see CREDITS.md.

execute unless entity @s[tag=vortex.admin] run return 0

data modify storage vortex:engine config.module_macro_function set value 1b
function vortex:core/config/apply

tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"macro_function","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"enabled","color":"green"}]
