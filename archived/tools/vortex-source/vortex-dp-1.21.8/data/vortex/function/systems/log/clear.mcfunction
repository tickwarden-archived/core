# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/log/clear
# Usage: /function vortex:systems/log/clear
# Clears the log buffer.
execute if data storage vortex:engine modules{log:0b} run return 0
execute unless entity @s[tag=vortex.admin] run return 0
data remove storage vortex:engine log_display
scoreboard players set #vortex.log_count vortex.tmp 0
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"Log buffer cleared.","color":"gray"}]
