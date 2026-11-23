# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:systems/flag/list_systems — List all tick systems with their current on/off state
tellraw @s [{"text":"[DL] Tick Systems","color":"gold","bold":true}]
tellraw @s [{"text":"time: ","color":"gray"},{"score":{"name":"#sys_time","objective":"vortex.tick_flags"},"color":"yellow"}]
tellraw @s [{"text":"player: ","color":"gray"},{"score":{"name":"#sys_player","objective":"vortex.tick_flags"},"color":"yellow"}]
tellraw @s [{"text":"queue: ","color":"gray"},{"score":{"name":"#sys_queue","objective":"vortex.tick_flags"},"color":"yellow"}]
tellraw @s [{"text":"hud: ","color":"gray"},{"score":{"name":"#sys_hud","objective":"vortex.tick_flags"},"color":"yellow"}]
tellraw @s [{"text":"admin: ","color":"gray"},{"score":{"name":"#sys_admin","objective":"vortex.tick_flags"},"color":"yellow"}]
