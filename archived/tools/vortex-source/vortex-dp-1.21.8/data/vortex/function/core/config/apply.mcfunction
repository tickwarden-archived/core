# vortex:core/config/apply
# Copies the runtime config in vortex:engine config to the places the engine reads.
# Called after every load, by core/config/set and by core/config/ensure. Values the engine
# divides by are clamped here, so a hand-edited bad value in storage cannot stop the tick.
#
#   module_<name>      -> vortex:engine modules.<name>   (read by the module guards and scans)
#   sys_<name>         -> #sys_<name> (vortex.tick_flags)
#   tick_rate          -> #vortaforge.packs.vortex.config.tick.rate (vortex.meta)
#   hud_rate, admin_rate, hook_interval, geo_interval, interaction_interval, wand_interval,
#   perm_trigger_interval -> #<key> (vortex.tick)
#   queue_max_depth    -> #queue_cap (vortex.tick)
#   log_level          -> #vortex.log_level (vortex.log_level)
#   perm_enforce, perm_cmd -> #perm_enforce, #perm_cmd (vortex.tick_flags; read by api/perm/require, api/perm/check, api/cmd/*)
# The store_*, title_*, validate_max_name and reload_warn keys are read straight from storage.

data modify storage vortex:engine modules.cb set from storage vortex:engine config.module_cb
data modify storage vortex:engine modules.cmd set from storage vortex:engine config.module_cmd
data modify storage vortex:engine modules.color set from storage vortex:engine config.module_color
data modify storage vortex:engine modules.gamerule set from storage vortex:engine config.module_gamerule
data modify storage vortex:engine modules.interaction set from storage vortex:engine config.module_interaction
data modify storage vortex:engine modules.item set from storage vortex:engine config.module_item
data modify storage vortex:engine modules.macro set from storage vortex:engine config.module_macro
data modify storage vortex:engine modules.macro_cmd set from storage vortex:engine config.module_macro_cmd
data modify storage vortex:engine modules.macro_function set from storage vortex:engine config.module_macro_function
data modify storage vortex:engine modules.perm set from storage vortex:engine config.module_perm
data modify storage vortex:engine modules.block set from storage vortex:engine config.module_block
data modify storage vortex:engine modules.container set from storage vortex:engine config.module_container
data modify storage vortex:engine modules.store set from storage vortex:engine config.module_store
data modify storage vortex:engine modules.title set from storage vortex:engine config.module_title
data modify storage vortex:engine modules.trigger set from storage vortex:engine config.module_trigger
data modify storage vortex:engine modules.wand set from storage vortex:engine config.module_wand
data modify storage vortex:engine modules.audit set from storage vortex:engine config.module_audit
data modify storage vortex:engine modules.geo set from storage vortex:engine config.module_geo
data modify storage vortex:engine modules.hook set from storage vortex:engine config.module_hook
data modify storage vortex:engine modules.log set from storage vortex:engine config.module_log
data modify storage vortex:engine modules.logic set from storage vortex:engine config.module_logic
data modify storage vortex:engine modules.math set from storage vortex:engine config.module_math
data modify storage vortex:engine modules.rate_limit set from storage vortex:engine config.module_rate_limit
data modify storage vortex:engine modules.rng set from storage vortex:engine config.module_rng
data modify storage vortex:engine modules.sound set from storage vortex:engine config.module_sound
data modify storage vortex:engine modules.string set from storage vortex:engine config.module_string
data modify storage vortex:engine modules.text set from storage vortex:engine config.module_text
data modify storage vortex:engine modules.uuid set from storage vortex:engine config.module_uuid

execute store result score #sys_time vortex.tick_flags run data get storage vortex:engine config.sys_time
execute store result score #sys_player vortex.tick_flags run data get storage vortex:engine config.sys_player
execute store result score #sys_queue vortex.tick_flags run data get storage vortex:engine config.sys_queue
execute store result score #sys_hud vortex.tick_flags run data get storage vortex:engine config.sys_hud
execute store result score #sys_admin vortex.tick_flags run data get storage vortex:engine config.sys_admin
execute store result score #perm_enforce vortex.tick_flags run data get storage vortex:engine config.perm_enforce
execute store result score #perm_cmd vortex.tick_flags run data get storage vortex:engine config.perm_cmd

execute store result score #cfg_v vortex.tmp run data get storage vortex:engine config.tick_rate
execute if score #cfg_v vortex.tmp matches ..0 run scoreboard players set #cfg_v vortex.tmp 1
execute if score #cfg_v vortex.tmp matches 1201.. run scoreboard players set #cfg_v vortex.tmp 1200
scoreboard players operation #vortaforge.packs.vortex.config.tick.rate vortex.meta = #cfg_v vortex.tmp
execute store result storage vortex:engine config.tick_rate int 1 run scoreboard players get #cfg_v vortex.tmp

execute store result score #cfg_v vortex.tmp run data get storage vortex:engine config.hud_rate
execute if score #cfg_v vortex.tmp matches ..0 run scoreboard players set #cfg_v vortex.tmp 1
execute if score #cfg_v vortex.tmp matches 1201.. run scoreboard players set #cfg_v vortex.tmp 1200
scoreboard players operation #hud_rate vortex.tick = #cfg_v vortex.tmp
execute store result storage vortex:engine config.hud_rate int 1 run scoreboard players get #cfg_v vortex.tmp

execute store result score #cfg_v vortex.tmp run data get storage vortex:engine config.admin_rate
execute if score #cfg_v vortex.tmp matches ..0 run scoreboard players set #cfg_v vortex.tmp 1
execute if score #cfg_v vortex.tmp matches 1201.. run scoreboard players set #cfg_v vortex.tmp 1200
scoreboard players operation #admin_rate vortex.tick = #cfg_v vortex.tmp
execute store result storage vortex:engine config.admin_rate int 1 run scoreboard players get #cfg_v vortex.tmp

execute store result score #cfg_v vortex.tmp run data get storage vortex:engine config.hook_interval
execute if score #cfg_v vortex.tmp matches ..0 run scoreboard players set #cfg_v vortex.tmp 1
execute if score #cfg_v vortex.tmp matches 1201.. run scoreboard players set #cfg_v vortex.tmp 1200
scoreboard players operation #hook_interval vortex.tick = #cfg_v vortex.tmp
execute store result storage vortex:engine config.hook_interval int 1 run scoreboard players get #cfg_v vortex.tmp

execute store result score #cfg_v vortex.tmp run data get storage vortex:engine config.geo_interval
execute if score #cfg_v vortex.tmp matches ..0 run scoreboard players set #cfg_v vortex.tmp 1
execute if score #cfg_v vortex.tmp matches 1201.. run scoreboard players set #cfg_v vortex.tmp 1200
scoreboard players operation #geo_interval vortex.tick = #cfg_v vortex.tmp
execute store result storage vortex:engine config.geo_interval int 1 run scoreboard players get #cfg_v vortex.tmp

execute store result score #cfg_v vortex.tmp run data get storage vortex:engine config.interaction_interval
execute if score #cfg_v vortex.tmp matches ..0 run scoreboard players set #cfg_v vortex.tmp 1
execute if score #cfg_v vortex.tmp matches 1201.. run scoreboard players set #cfg_v vortex.tmp 1200
scoreboard players operation #interaction_interval vortex.tick = #cfg_v vortex.tmp
execute store result storage vortex:engine config.interaction_interval int 1 run scoreboard players get #cfg_v vortex.tmp

execute store result score #cfg_v vortex.tmp run data get storage vortex:engine config.wand_interval
execute if score #cfg_v vortex.tmp matches ..0 run scoreboard players set #cfg_v vortex.tmp 1
execute if score #cfg_v vortex.tmp matches 1201.. run scoreboard players set #cfg_v vortex.tmp 1200
scoreboard players operation #wand_interval vortex.tick = #cfg_v vortex.tmp
execute store result storage vortex:engine config.wand_interval int 1 run scoreboard players get #cfg_v vortex.tmp

execute store result score #cfg_v vortex.tmp run data get storage vortex:engine config.perm_trigger_interval
execute if score #cfg_v vortex.tmp matches ..0 run scoreboard players set #cfg_v vortex.tmp 1
execute if score #cfg_v vortex.tmp matches 1201.. run scoreboard players set #cfg_v vortex.tmp 1200
scoreboard players operation #perm_trigger_interval vortex.tick = #cfg_v vortex.tmp
execute store result storage vortex:engine config.perm_trigger_interval int 1 run scoreboard players get #cfg_v vortex.tmp

execute store result score #cfg_v vortex.tmp run data get storage vortex:engine config.queue_max_depth
execute if score #cfg_v vortex.tmp matches ..0 run scoreboard players set #cfg_v vortex.tmp 1
execute if score #cfg_v vortex.tmp matches 4097.. run scoreboard players set #cfg_v vortex.tmp 4096
scoreboard players operation #queue_cap vortex.tick = #cfg_v vortex.tmp
execute store result storage vortex:engine config.queue_max_depth int 1 run scoreboard players get #cfg_v vortex.tmp

execute store result score #cfg_v vortex.tmp run data get storage vortex:engine config.log_level
execute if score #cfg_v vortex.tmp matches ..-1 run scoreboard players set #cfg_v vortex.tmp 0
execute if score #cfg_v vortex.tmp matches 5.. run scoreboard players set #cfg_v vortex.tmp 4
scoreboard players operation #vortex.log_level vortex.log_level = #cfg_v vortex.tmp
execute store result storage vortex:engine config.log_level int 1 run scoreboard players get #cfg_v vortex.tmp
