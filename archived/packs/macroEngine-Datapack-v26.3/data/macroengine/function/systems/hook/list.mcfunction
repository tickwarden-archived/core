# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:systems/hook/list
# Shows all registered hook binds to macroengine.admin players.

execute if data storage macroengine:engine modules{hook:0b} run return 0
tellraw @a[tag=macroengine.admin] ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"━━━ Hook Binds ","color":"aqua"},{"text":"━━━━━━━━━━━━━━━━","color":"#555555"}]
execute unless data storage macroengine:engine hook_binds[0] run tellraw @a[tag=macroengine.admin] ["",{"text":" ","color":"#555555"},{"text":"(no hook binds)","color":"gray","italic":true}]
execute if data storage macroengine:engine hook_binds[0] run tellraw @a[tag=macroengine.admin] ["",{"text":" ","color":"#555555"},{"plain":true ,"storage":"macroengine:engine","nbt":"hook_binds","interpret":false,"color":"yellow"}]
tellraw @a[tag=macroengine.admin] ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
