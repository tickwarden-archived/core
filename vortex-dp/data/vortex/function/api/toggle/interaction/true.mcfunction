# vortex:api/toggle/interaction/true — Enable the interaction (IE) module

execute unless entity @s[tag=vortex.admin] run return 0

data modify storage vortex:engine config.module_interaction set value 1b
function vortex:core/config/apply

tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"interaction","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"enabled","color":"green"}]
