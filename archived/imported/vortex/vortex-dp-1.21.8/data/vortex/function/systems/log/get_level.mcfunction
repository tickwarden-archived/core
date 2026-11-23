# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/log/get_level
# Usage: /function vortex:systems/log/get_level
# Shows the current log level.
execute if data storage vortex:engine modules{log:0b} run return 0
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"Log level: ","color":"gray"},{"score":{"name":"#vortex.log_level","objective":"vortex.log_level"},"color":"white","bold":true},{"text":"  (0=off 1=error 2=warn 3=info 4=debug)","color":"#555555"}]
