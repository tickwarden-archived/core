# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:systems/geo/region_watch/list
# Shows all registered regions to admin players.
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine modules{geo:0b} run return 0
tellraw @a[tag=vortex.admin] ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━ Region Watches ━━━━━━━━━━━━━━","color":"aqua"}]
execute if data storage vortex:engine region_watches run tellraw @a[tag=vortex.admin] ["",{"text":" ","color":"#555555"},{"plain":true ,"storage":"vortex:engine","nbt":"region_watches","interpret":false,"color":"yellow"}]
execute unless data storage vortex:engine region_watches run tellraw @a[tag=vortex.admin] ["",{"text":" (no regions registered)","color":"gray","italic":true}]
tellraw @a[tag=vortex.admin] ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
