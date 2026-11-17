# vortex:api/cmd/other/multi_cmd/advanced/run_with_options
# Run with advanced options.
#
# INPUT (storage vortex:input):
#   list    → command list (string or object)
#   options → {priority_sort:1b, spread_ticks:0, error_mode:"continue", profile:1b, type:"..."}
#

execute if data storage vortex:engine modules{cmd:0b} run return 0
execute if score #perm_cmd vortex.tick_flags matches 1 run data modify storage vortex:perm_require in set value {perm:"cmd.other.multi_cmd.advanced.run_with_options"}
execute if score #perm_cmd vortex.tick_flags matches 1 unless function vortex:api/perm/require run return 0
data modify storage vortex:engine _mcmd_queue set from storage vortex:input list
execute unless data storage vortex:input options run data modify storage vortex:input options set value {}
data modify storage vortex:engine _mcmd_options merge from storage vortex:input options

execute unless data storage vortex:engine _mcmd_options.error_mode run data modify storage vortex:engine _mcmd_options.error_mode set value "continue"
execute unless data storage vortex:engine _mcmd_options.profile run data modify storage vortex:engine _mcmd_options.profile set value 0b
execute unless data storage vortex:engine _mcmd_options.spread_ticks run data modify storage vortex:engine _mcmd_options.spread_ticks set value 0

execute if data storage vortex:engine _mcmd_options{priority_sort:1b} run function vortex:core/internal/api/cmd/other/multi_cmd/advanced/sort_by_priority
execute if data storage vortex:engine _mcmd_options.spread_ticks unless data storage vortex:engine _mcmd_options{spread_ticks:0} run return run function vortex:core/internal/api/cmd/other/multi_cmd/advanced/run_spread

function vortex:api/cmd/other/multi_cmd/run
