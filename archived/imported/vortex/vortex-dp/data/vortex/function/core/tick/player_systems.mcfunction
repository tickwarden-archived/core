# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/tick/player_systems
execute as @a[scores={vortex.run=1..}] run function #vortex:admin/run
scoreboard players set @a[scores={vortex.run=1..}] vortex.run 0
scoreboard players enable @a[scores={vortex.run=-1..}] vortex.run

execute as @a[scores={vortex.action=1..}] run function vortex:core/internal/api/trigger/dispatch

function vortex:core/internal/api/interaction/tick_scan

function vortex:core/internal/api/perm/trigger/tick_start

function vortex:core/internal/api/wand/tick_scan
function vortex:core/internal/systems/hook/tick_scan

function vortex:core/internal/systems/geo/region_watch/tick_scan
function vortex:core/internal/api/cmd/freeze/tick

execute as @e[type=minecraft:item] if items entity @s contents *[minecraft:custom_data~{vortex:{input:1b}}] at @s on origin run data merge entity @n[type=minecraft:item,distance=..0.1] {PickupDelay:0s}
kill @e[type=minecraft:item,nbt={Item:{components:{"minecraft:custom_data":{vortex:{input:1b,inputItem:"anvil"}}}}}]
