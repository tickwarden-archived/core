# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/config/list
# Prints the runtime config to @s. The values are read from storage by an NBT component.
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"config ","color":"aqua"},{"storage":"vortex:engine","nbt":"config","interpret":false,"color":"green","plain":true}]
