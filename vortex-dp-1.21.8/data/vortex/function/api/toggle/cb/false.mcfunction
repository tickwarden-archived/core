# vortex:api/toggle/cb/false
data modify storage vortex:engine config.module_cb set value 0b
function vortex:core/config/apply

tellraw @s [{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"cb module: ","color":"aqua"},{"text":"disabled","color":"red"}]
