# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/color/palette_list
# Prints all registered palette entries to the calling player.
# Requires vortex.admin tag.
#
# Usage:
#   function vortex:api/color/palette_list

execute if data storage vortex:engine modules{color:0b} run return 0
execute unless entity @s[tag=vortex.admin] run return 0

tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━ Color Palette ","color":"aqua"},{"text":"━━━━━━━━━━━","color":"#555555"}]
execute if data storage vortex:engine color.palette run tellraw @s ["",{"text":" ","color":"#555555"},{"plain":true ,"storage":"vortex:engine","nbt":"color.palette","interpret":false,"color":"green"}]
execute unless data storage vortex:engine color.palette run tellraw @s ["",{"text":" ","color":"#555555"},{"text":"(palette is empty)","color":"gray","italic":true}]
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
