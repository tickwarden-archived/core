# vortex:core/config/list
# Prints the runtime config to @s. The values are read from storage by an NBT component.
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"config ","color":"aqua"},{"storage":"vortex:engine","nbt":"config","interpret":false,"color":"green","plain":true}]
