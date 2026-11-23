# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/state/list
tellraw @a[tag=macroengine.admin] ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"━━━ Player States ","color":"aqua"},{"text":"━━━━━━━━━━","color":"#555555"}]
execute if data storage macroengine:engine states run tellraw @a[tag=macroengine.admin] ["",{"text":" ","color":"#555555"},{"plain":true ,"storage":"macroengine:engine","nbt":"states","interpret":false,"color":"white"}]
execute unless data storage macroengine:engine states run tellraw @a[tag=macroengine.admin] ["",{"text":" ","color":"#555555"},{"text":"(no active states)","color":"gray","italic":true}]
tellraw @a[tag=macroengine.admin] ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
