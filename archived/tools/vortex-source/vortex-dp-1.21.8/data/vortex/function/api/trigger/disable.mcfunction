# vortex:api/trigger/disable [MACRO]
execute if data storage vortex:engine modules{trigger:0b} run return 0
$scoreboard players reset $(player) vortex.action
