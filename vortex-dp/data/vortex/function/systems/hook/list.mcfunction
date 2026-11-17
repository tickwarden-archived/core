# vortex:systems/hook/list
# Shows all registered hook binds to vortex.admin players.

execute if data storage vortex:engine modules{hook:0b} run return 0
tellraw @a[tag=vortex.admin] ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━ Hook Binds ","color":"aqua"},{"text":"━━━━━━━━━━━━━━━━","color":"#555555"}]
execute unless data storage vortex:engine hook_binds[0] run tellraw @a[tag=vortex.admin] ["",{"text":" ","color":"#555555"},{"text":"(no hook binds)","color":"gray","italic":true}]
execute if data storage vortex:engine hook_binds[0] run tellraw @a[tag=vortex.admin] ["",{"text":" ","color":"#555555"},{"plain":true ,"storage":"vortex:engine","nbt":"hook_binds","interpret":false,"color":"yellow"}]
tellraw @a[tag=vortex.admin] ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
