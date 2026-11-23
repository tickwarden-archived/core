# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# DL Tick — Simplified Dispatch (no runtime channel registry)
# Rates come from the runtime config (core/config/apply); there is no JSON-configurable list.
# Each system can be toggled on/off via a scoreboard flag (default 1 = on),
# set with: function vortex:systems/flag/toggle_system {system:"time"}
# Valid system ids: time | player | queue | hud | admin
#
# time_systems / player_systems / queue_systems: every tick (rate 1)
# hud_systems: every config.hud_rate engine ticks (default 2)
# admin_systems: every config.admin_rate engine ticks (default 4)
# The rates are set by core/config/apply from vortex:engine config.
scoreboard players add #tick_ctr vortex.tick 1

execute unless score #sys_time vortex.tick_flags matches 0 run function vortex:core/tick/time_systems
execute unless score #sys_player vortex.tick_flags matches 0 run function vortex:core/tick/player_systems
execute unless score #sys_queue vortex.tick_flags matches 0 run function vortex:core/tick/queue_systems

scoreboard players operation #hud_mod vortex.tick = #tick_ctr vortex.tick
scoreboard players operation #hud_mod vortex.tick %= #hud_rate vortex.tick
execute if score #hud_mod vortex.tick matches 0 unless score #sys_hud vortex.tick_flags matches 0 run function vortex:core/tick/hud_systems

scoreboard players operation #admin_mod vortex.tick = #tick_ctr vortex.tick
scoreboard players operation #admin_mod vortex.tick %= #admin_rate vortex.tick
execute if score #admin_mod vortex.tick matches 0 unless score #sys_admin vortex.tick_flags matches 0 run function vortex:core/tick/admin_systems
