# vortex:api/trigger/enable [MACRO]
execute if data storage vortex:engine modules{trigger:0b} run return 0
$scoreboard players enable $(player) vortex.action
