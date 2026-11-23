# Module toggle guard — skips this module when disabled via vortex:api/toggle/perm/false
execute unless data storage vortex:engine {modules:{perm:1b}} run return 0
scoreboard players operation #scan_mod vortex.tick = #tick_ctr vortex.tick
scoreboard players operation #scan_mod vortex.tick %= #perm_trigger_interval vortex.tick
execute unless score #scan_mod vortex.tick matches 0 run return 0

execute unless data storage vortex:engine perm_trigger_names[0] run return 0

data modify storage vortex:engine _pt_names_tmp set from storage vortex:engine perm_trigger_names
function vortex:core/internal/api/perm/trigger/tick_step_loop
data remove storage vortex:engine _pt_names_tmp
