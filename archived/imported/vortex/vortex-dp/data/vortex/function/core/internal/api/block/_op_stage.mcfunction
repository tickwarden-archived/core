# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/block/_op_stage [INTERNAL]
# Runs the handler named like the op (insert, take, hopper_in, hopper_out); with no handler the
# default container behaviour runs. RETURN 1 success, 0 failure.
data modify storage vortex:block tmp.m.h set from storage vortex:block tmp.m.op
execute store result score #bk_r vortex.tmp run function vortex:core/internal/api/block/_call with storage vortex:block tmp.m
execute if score #bk_r vortex.tmp matches 1.. run return 1
execute if score #bk_r vortex.tmp matches 0 run return 0
execute if data storage vortex:block tmp.m{op:"insert"} run return run function vortex:core/internal/api/block/_default_insert
execute if data storage vortex:block tmp.m{op:"hopper_in"} run return run function vortex:core/internal/api/block/_default_insert
return run function vortex:core/internal/api/block/_default_take
