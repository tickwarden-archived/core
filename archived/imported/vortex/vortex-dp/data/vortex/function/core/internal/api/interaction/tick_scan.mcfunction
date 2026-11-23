# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# Module toggle guard — skips this module when disabled via vortex:api/toggle/interaction/false
execute unless data storage vortex:engine {modules:{interaction:1b}} run return 0
scoreboard players operation #scan_mod vortex.tick = #tick_ctr vortex.tick
scoreboard players operation #scan_mod vortex.tick %= #interaction_interval vortex.tick
execute unless score #scan_mod vortex.tick matches 0 run return 0

execute unless entity @e[type=minecraft:interaction,tag=vortex.interaction,limit=1] run return 0

execute if data storage vortex:engine interaction_binds.attack[0] run execute as @e[type=minecraft:interaction,tag=vortex.interaction] if data entity @s attack run function vortex:core/internal/api/interaction/on_attack

execute if data storage vortex:engine interaction_binds.use[0] run execute as @e[type=minecraft:interaction,tag=vortex.interaction] if data entity @s interaction run function vortex:core/internal/api/interaction/on_use
