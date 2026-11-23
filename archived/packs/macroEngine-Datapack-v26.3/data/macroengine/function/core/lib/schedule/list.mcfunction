# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/lib/schedule/list
tellraw @s ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"━━━ Active Schedules ","color":"aqua"},{"text":"━━━━━━━━━","color":"#555555"}]
execute if data storage macroengine:engine schedules run tellraw @a[tag=macroengine.admin] ["",{"text":" ","color":"#555555"},{"plain":true ,"storage":"macroengine:engine","nbt":"schedules","interpret":false,"color":"gold"}]
execute unless data storage macroengine:engine schedules run tellraw @a[tag=macroengine.admin] ["",{"text":" ","color":"#555555"},{"text":"(no active schedules)","color":"gray","italic":true}]
tellraw @s ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
