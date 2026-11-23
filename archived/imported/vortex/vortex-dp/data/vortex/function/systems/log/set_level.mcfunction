# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/log/set_level
# Usage: $function vortex:systems/log/set_level {level:3}
# Sets the active log level:
#   0 = off
#   1 = error only
#   2 = warn + error
#   3 = info + warn + error  (default)
#   4 = debug (all)
execute if data storage vortex:engine modules{log:0b} run return 0
execute unless entity @s[tag=vortex.admin] run return 0
$scoreboard players set #vortex.log_level vortex.log_level $(level)
execute store result storage vortex:engine config.log_level int 1 run scoreboard players get #vortex.log_level vortex.log_level
$tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"Log level set to ","color":"gray"},{"text":"$(level)","color":"white","bold":true}]
