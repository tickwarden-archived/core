# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/block/list
# Prints the registered custom blocks to @s.
execute if data storage vortex:engine modules{block:0b} run return 0
tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"block/list","color":"aqua"}]
tellraw @s ["",{"text":" blocks: ","color":"#555555"},{"plain":true,"storage":"vortex:engine","nbt":"block_registry","color":"white","interpret":false}]
