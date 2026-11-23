# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:systems/flag/list
tellraw @a[tag=vortex.admin] ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━ Global Flags ","color":"aqua"},{"text":"━━━━━━━━━━━","color":"#555555"}]
execute if data storage vortex:engine flags run tellraw @a[tag=vortex.admin] ["",{"text":" ","color":"#555555"},{"plain":true ,"storage":"vortex:engine","nbt":"flags","interpret":false,"color":"white"}]
execute unless data storage vortex:engine flags run tellraw @a[tag=vortex.admin] ["",{"text":" ","color":"#555555"},{"text":"(no active flags)","color":"gray","italic":true}]
tellraw @a[tag=vortex.admin] ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"━━━━━━━━━━━━━━━━━━━","color":"#555555"}]
