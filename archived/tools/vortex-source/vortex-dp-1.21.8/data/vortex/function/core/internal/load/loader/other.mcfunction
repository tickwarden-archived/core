# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/load/loader/other
forceload add 0 0

data modify storage vortex:input func set value "vortex:core/runtime/sync_tick"
data modify storage vortex:input interval set value 20
data modify storage vortex:input key set value "sync_tick"
function vortex:core/runtime/schedule with storage vortex:input {}
data remove storage vortex:input func
data remove storage vortex:input interval
data remove storage vortex:input key

scoreboard players enable @a[tag=vortex.admin] vortex.run
scoreboard players enable @a[tag=vortex.admin] vortex.action

# Initialize tick system on/off flags on first world load (idempotent —
# "unless matches .." only true when score is unset, so this never
# overwrites a runtime toggle made via flag/toggle_system)
execute unless score #sys_time vortex.tick_flags matches 1.. run scoreboard players set #sys_time vortex.tick_flags 1
execute unless score #sys_player vortex.tick_flags matches 1.. run scoreboard players set #sys_player vortex.tick_flags 1
execute unless score #sys_queue vortex.tick_flags matches 1.. run scoreboard players set #sys_queue vortex.tick_flags 1
execute unless score #sys_hud vortex.tick_flags matches 1.. run scoreboard players set #sys_hud vortex.tick_flags 1
execute unless score #sys_admin vortex.tick_flags matches 1.. run scoreboard players set #sys_admin vortex.tick_flags 1

# Assign pid for any players already online at load time
# (on_player_join won't fire for them after a /reload)
execute as @a run function vortex:core/internal/player/init_online
