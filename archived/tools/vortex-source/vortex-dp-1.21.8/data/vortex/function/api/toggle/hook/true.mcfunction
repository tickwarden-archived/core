# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/toggle/hook/true — Enable the hook module
# Called by the module toggle menu when State = true.
# Caller: vortex.admin tag required (enforced by the admin-tag guard in show.mcfunction)

execute unless entity @s[tag=vortex.admin] run return 0

data modify storage vortex:engine config.module_hook set value 1b
function vortex:core/config/apply

tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"hook","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"enabled","color":"green"}]
