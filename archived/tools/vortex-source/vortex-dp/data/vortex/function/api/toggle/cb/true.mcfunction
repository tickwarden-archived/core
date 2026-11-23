# vortex:api/toggle/cb/true
data modify storage vortex:engine config.module_cb set value 1b
function vortex:core/config/apply

tellraw @s [{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"cb module: ","color":"aqua"},{"text":"enabled","color":"green"}]
