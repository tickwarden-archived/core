# vortex:api/toggle/container/false — Disable the container module

execute unless entity @s[tag=vortex.admin] run return 0

data modify storage vortex:engine config.module_container set value 0b
function vortex:core/config/apply

tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"container","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"disabled","color":"red"}]
