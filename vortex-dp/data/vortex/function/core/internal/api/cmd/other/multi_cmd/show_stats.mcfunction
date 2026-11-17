# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/show_stats
# Writes the run's statistics to _mcmd_stats and reports them.
#
# The previous version computed
#     $mcmd_duration = $mcmd_end_time
#     $mcmd_duration -= $mcmd_duration
# which is unconditionally 0 — the start_time it had just read was
# discarded on the next line. Wall-clock duration and per-entry
# execution time are both real numbers now.
# ─────────────────────────────────────────────────────────────────

execute store result score $mcmd_end_time vortex.tmp run time query gametime
execute store result score $mcmd_start_time vortex.tmp run data get storage vortex:engine _mcmd_stats.start_time

scoreboard players operation $mcmd_duration vortex.tmp = $mcmd_end_time vortex.tmp
scoreboard players operation $mcmd_duration vortex.tmp -= $mcmd_start_time vortex.tmp
execute if score $mcmd_duration vortex.tmp matches ..-1 run scoreboard players set $mcmd_duration vortex.tmp 0

execute store result storage vortex:engine _mcmd_stats.total int 1 run scoreboard players get $mcmd_total vortex.tmp
execute store result storage vortex:engine _mcmd_stats.success int 1 run scoreboard players get $mcmd_success vortex.tmp
execute store result storage vortex:engine _mcmd_stats.skipped int 1 run scoreboard players get $mcmd_skipped vortex.tmp
execute store result storage vortex:engine _mcmd_stats.duration int 1 run scoreboard players get $mcmd_duration vortex.tmp
execute store result storage vortex:engine _mcmd_stats.exec_time int 1 run scoreboard players get $mcmd_exec_total vortex.tmp

data modify storage vortex:output stats set from storage vortex:engine _mcmd_stats

tellraw @a[tag=vortex.admin] ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"multi_cmd profile ","color":"gray"},{"text":"→ ","color":"#555555"},{"plain":true,"interpret":false,"storage":"vortex:engine","nbt":"_mcmd_stats","color":"white"}]

scoreboard players reset $mcmd_total vortex.tmp
scoreboard players reset $mcmd_success vortex.tmp
scoreboard players reset $mcmd_skipped vortex.tmp
scoreboard players reset $mcmd_exec_total vortex.tmp
scoreboard players reset $mcmd_duration vortex.tmp
scoreboard players reset $mcmd_start_time vortex.tmp
scoreboard players reset $mcmd_end_time vortex.tmp
data remove storage vortex:engine _mcmd_stats
