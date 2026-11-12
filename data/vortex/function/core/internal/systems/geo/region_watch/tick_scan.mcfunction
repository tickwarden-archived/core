# vortex:systems/geo/region_watch/internal/tick_scan
# Called directly from core/tick/queue_systems.mcfunction.
# If region_watches is non-empty, checks all regions for each player.

# Module toggle guard — skips this module when disabled via vortex:api/toggle/geo/false
execute unless data storage vortex:engine {modules:{geo:1b}} run return 0
scoreboard players operation #scan_mod vortex.tick = #tick_ctr vortex.tick
scoreboard players operation #scan_mod vortex.tick %= #geo_interval vortex.tick
execute unless score #scan_mod vortex.tick matches 0 run return 0

execute unless data storage vortex:engine region_watches run return 0

execute as @a run function vortex:core/internal/systems/geo/region_watch/player_scan
