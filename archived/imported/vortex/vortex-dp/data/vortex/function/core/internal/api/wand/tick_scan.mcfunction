# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/wand/tick_scan
# Every tick: detect players with vortex.right_click score 1+,
# check their held item, run the matching bind.

# Module toggle guard — skips this module when disabled via vortex:api/toggle/wand/false
execute unless data storage vortex:engine {modules:{wand:1b}} run return 0
scoreboard players operation #scan_mod vortex.tick = #tick_ctr vortex.tick
scoreboard players operation #scan_mod vortex.tick %= #wand_interval vortex.tick
execute unless score #scan_mod vortex.tick matches 0 run return 0

execute unless data storage vortex:engine wand_binds[0] run return 0

execute as @a[scores={vortex.right_click=1..}] at @s run function vortex:core/internal/api/wand/dispatch
scoreboard players set @a[scores={vortex.right_click=1..}] vortex.right_click 0
