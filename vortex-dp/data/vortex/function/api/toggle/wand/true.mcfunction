# vortex:api/toggle/wand/true — Enable the wand module

execute unless entity @s[tag=vortex.admin] run return 0

data modify storage vortex:engine config.module_wand set value 1b
function vortex:core/config/apply

tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"wand","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"enabled","color":"green"}]
