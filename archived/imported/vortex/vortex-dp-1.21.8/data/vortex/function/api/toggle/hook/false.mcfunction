# vortex:api/toggle/hook/false — Disable the hook module
# Called by the module toggle menu when State = false.
# Caller: vortex.admin tag required (enforced by the admin-tag guard in show.mcfunction)

execute unless entity @s[tag=vortex.admin] run return 0

data modify storage vortex:engine config.module_hook set value 0b
function vortex:core/config/apply

tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"hook","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"disabled","color":"red"}]
