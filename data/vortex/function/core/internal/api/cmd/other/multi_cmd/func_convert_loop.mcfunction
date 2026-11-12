# Convert string list to {func:"..."} objects
execute unless data storage vortex:input list[0] run return 0

data modify storage vortex:engine _mcmd_func_tmp set value {}
data modify storage vortex:engine _mcmd_func_tmp.func set from storage vortex:input list[0]
data modify storage vortex:engine _mcmd_queue append from storage vortex:engine _mcmd_func_tmp

data remove storage vortex:input list[0]
function vortex:core/internal/api/cmd/other/multi_cmd/func_convert_loop
