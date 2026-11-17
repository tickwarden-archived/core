# vortex:core/internal/load/cleanup
# Full reverse of loader/scoreboards + loader/storages + the third (other.mcfunction)
# load-time file. Undoes every init action from those three, in reverse order
# (last-loaded first, so nothing here depends on something already torn down).
#
# Caveats for the best-guess vanilla equivalents used below:
#   - "schedule clear <fn>" cancels the sync_tick schedule set via
#     core/runtime/schedule — correct IF that lib wraps vanilla `schedule function`.
#     If it uses its own queue/storage instead, this line does nothing and the
#     entry must be cleared from wherever core/runtime/schedule actually tracks it.
#   - There's no known vortex:core/internal/systems/uuid/cleanup or
#     vortex:systems/color/cleanup counterpart to the two `function` calls
#     in storages.mcfunction — left as comments, not invented calls.
#   - $epoch is normally preserved across /reload (per the header comment in
#     storages.mcfunction). Since this is a full teardown, not a reload, it's
#     cleared here too — remove that line if you actually want epoch to survive.

# ── reverse of other.mcfunction ──────────────────────────────────────────
# "Assign pid for any players already online" has no real inverse command —
# it's undone by dropping the storage that held the pids (player_pids /
# _pid_seq), further down where loader/storages is reversed.

tag @s remove vortex.admin

# text module: working buffers and lookup tables
function vortex:core/internal/text/unload

kill @e[type=minecraft:command_block_minecart,tag=vortex.input]

execute if score #sys_admin vortex.tick_flags matches 1.. run scoreboard players reset #sys_admin vortex.tick_flags
execute if score #sys_hud vortex.tick_flags matches 1.. run scoreboard players reset #sys_hud vortex.tick_flags
execute if score #sys_queue vortex.tick_flags matches 1.. run scoreboard players reset #sys_queue vortex.tick_flags
execute if score #sys_player vortex.tick_flags matches 1.. run scoreboard players reset #sys_player vortex.tick_flags
execute if score #sys_time vortex.tick_flags matches 1.. run scoreboard players reset #sys_time vortex.tick_flags

scoreboard players reset @a[tag=vortex.admin] vortex.action
scoreboard players reset @a[tag=vortex.admin] vortex.run

schedule clear vortex:core/runtime/sync_tick

forceload remove 0 0

# ── reverse of loader/storages ───────────────────────────────────────────
# Color API — no known cleanup counterpart to `function vortex:systems/color/init`
# function vortex:systems/color/cleanup

data remove storage vortex:engine modules.cb
data remove storage vortex:engine _cb_entry
data remove storage vortex:engine _cb_work
data remove storage vortex:engine _cb_last
data remove storage vortex:engine cb_queue

data remove storage vortex:engine modules.geo
data remove storage vortex:engine modules.wand
data remove storage vortex:engine modules.perm
data remove storage vortex:engine modules.block
data remove storage vortex:engine modules.container
data remove storage vortex:engine modules.interaction
data remove storage vortex:engine modules.hook

data remove storage vortex:engine multiCommands

data remove storage vortex:engine wand_cooldowns

data remove storage vortex:engine batches

data remove storage vortex:engine region_watches

data remove storage vortex:engine fibers

data remove storage vortex:engine hook_binds

data remove storage vortex:engine wand_binds

data remove storage vortex:engine once_per_player

# UUID module — no known cleanup counterpart to `function vortex:core/internal/systems/uuid/init`
# function vortex:core/internal/systems/uuid/cleanup

data remove storage vortex:engine _pid_seq
data remove storage vortex:engine player_pids

data remove storage vortex:engine interaction_binds

data remove storage vortex:engine trigger_binds

data remove storage vortex:engine perm_trigger_names
data remove storage vortex:engine perm_triggers

data remove storage vortex:engine permissions

data remove storage vortex:engine states
data remove storage vortex:engine flags

data remove storage vortex:engine throttle

scoreboard players reset $pb_four vortex.tmp
scoreboard players reset $pq_depth vortex.tmp
scoreboard players reset $tick vortex.tmp
scoreboard players reset $epoch vortex.time

# ── reverse of loader/scoreboards ────────────────────────────────────────
scoreboard objectives remove vortex.state
scoreboard objectives remove vortex.gamerule
scoreboard objectives remove vortex.log_level
scoreboard objectives remove vortex.hook_fish
scoreboard objectives remove vortex.hook_eat
scoreboard objectives remove vortex.hook_target_hit
scoreboard objectives remove vortex.hook_drop
scoreboard objectives remove vortex.hook_open_chest
scoreboard objectives remove vortex.hook_jump
scoreboard objectives remove vortex.flags
scoreboard objectives remove vortex.tick_flags
scoreboard objectives remove vortex.tick
scoreboard objectives remove vortex.hook_traded
scoreboard objectives remove vortex.hook_dim_changed
scoreboard objectives remove vortex.hook_hero_of_the_village
scoreboard objectives remove vortex.hook_killed_by_arrow
scoreboard objectives remove vortex.hook_using_item
scoreboard objectives remove vortex.hook_entity_killed
scoreboard objectives remove vortex.hook_item_used
scoreboard objectives remove vortex.hook_tool_used
scoreboard objectives remove vortex.hook_elytra
scoreboard objectives remove vortex.hook_sprint
scoreboard objectives remove vortex.hook_sneak
scoreboard objectives remove vortex.hook_lvl_new
scoreboard objectives remove vortex.hook_lvl
scoreboard objectives remove vortex.hook_placed
scoreboard objectives remove vortex.hook_deaths
scoreboard objectives remove vortex.hook_online
scoreboard objectives remove vortex.right_click
scoreboard objectives remove vortex.freeze_id
scoreboard objectives remove vortex.pid
scoreboard objectives remove vortex.action
scoreboard objectives remove vortex.run
scoreboard objectives remove vortex.time
scoreboard objectives remove vortex.meta
scoreboard objectives remove vortex.tmp
