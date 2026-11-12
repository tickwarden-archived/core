# vortex:api/store/player/show
# Reads the executor's per-player value (api/store/player/get) and prints it to @s with tellraw.
#
# INPUT  vortex:store in.name (string)
# OUTPUT vortex:store out.value (same as api/store/player/get); a chat line for @s
# RETURN 1 when the value exists and was shown, 0 when it is unset or in.name is missing or invalid.
#
# The value is read straight from storage by an NBT text component with "interpret": false,
# so strings are shown as written and numbers, lists and compounds as SNBT. Nothing is
# ever stored as a text component; the component only exists while the line is printed.
#
# Usage:
#   data modify storage vortex:store in set value {name:"shop.price"}
#   function vortex:api/store/player/show
execute if data storage vortex:engine modules{store:0b} run return 0
execute store success score #st_show vortex.tmp run function vortex:api/store/player/get
execute if score #st_show vortex.tmp matches 0 run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"store: value is not set, or in.name is missing or invalid","color":"yellow"}]
execute if score #st_show vortex.tmp matches 0 run return 0
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"storage":"vortex:store","nbt":"in.name","interpret":false,"color":"gray","plain":true},{"text":" = ","color":"dark_gray"},{"storage":"vortex:store","nbt":"out.value","interpret":false,"color":"green","plain":true}]
return 1
