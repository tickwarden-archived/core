# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/other/multi_cmd/run
# Execute queued commands
# ─────────────────────────────────────────────────────────────────

# Reset statistics
execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.other.multi_cmd.run"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
execute if data storage vortex:engine _mcmd_options{profile:1b} run data modify storage vortex:engine _mcmd_stats set value {total:0,success:0,skipped:0,start_time:0,duration:0,exec_time:0}
execute if data storage vortex:engine _mcmd_options{profile:1b} run scoreboard players set $mcmd_total vortex.tmp 0
execute if data storage vortex:engine _mcmd_options{profile:1b} run scoreboard players set $mcmd_success vortex.tmp 0
execute if data storage vortex:engine _mcmd_options{profile:1b} run scoreboard players set $mcmd_skipped vortex.tmp 0
execute if data storage vortex:engine _mcmd_options{profile:1b} run scoreboard players set $mcmd_exec_total vortex.tmp 0
execute if data storage vortex:engine _mcmd_options{profile:1b} run execute store result storage vortex:engine _mcmd_stats.start_time int 1 run time query gametime

# Start recursive stepping
function vortex:core/internal/api/cmd/other/multi_cmd/step

# Cleanup
function vortex:core/internal/api/cmd/other/multi_cmd/cleanup

# Show statistics
execute if data storage vortex:engine _mcmd_options{profile:1b} run function vortex:core/internal/api/cmd/other/multi_cmd/show_stats
