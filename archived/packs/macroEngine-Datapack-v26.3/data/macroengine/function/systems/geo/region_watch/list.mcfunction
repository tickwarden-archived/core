# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:systems/geo/region_watch/list
# Shows all registered regions to admin players.
# ─────────────────────────────────────────────────────────────────

execute if data storage macroengine:engine modules{geo:0b} run return 0
tellraw @a[tag=macroengine.admin] ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"━━━ Region Watches ━━━━━━━━━━━━━━","color":"aqua"}]
execute if data storage macroengine:engine region_watches run tellraw @a[tag=macroengine.admin] ["",{"text":" ","color":"#555555"},{"plain":true ,"storage":"macroengine:engine","nbt":"region_watches","interpret":false,"color":"yellow"}]
execute unless data storage macroengine:engine region_watches run tellraw @a[tag=macroengine.admin] ["",{"text":" (no regions registered)","color":"gray","italic":true}]
tellraw @a[tag=macroengine.admin] ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
