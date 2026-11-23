# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/toggle/wand/false — Disable the wand module

execute unless entity @s[tag=vortex.admin] run return 0

data modify storage vortex:engine config.module_wand set value 0b
function vortex:core/config/apply

tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"wand","color":"aqua"},{"text":" → ","color":"#555555"},{"text":"disabled","color":"red"}]
