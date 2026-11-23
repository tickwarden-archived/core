# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/other/multi_cmd/advanced/internal/run_spread_tick
# Called once per tick by `schedule` to process the next spread command.
# Self-schedules until _mcmd_queue is drained.
# ─────────────────────────────────────────────────────────────────

execute unless data storage vortex:engine _mcmd_queue[0] run return 0

data modify storage vortex:engine _mcmd_current set from storage vortex:engine _mcmd_queue[0]
data remove storage vortex:engine _mcmd_queue[0]

execute if data storage vortex:engine _mcmd_current{} run function vortex:core/internal/api/cmd/other/multi_cmd/exec_object
execute unless data storage vortex:engine _mcmd_current{} run function vortex:core/internal/api/cmd/other/multi_cmd/exec_string

data remove storage vortex:engine _mcmd_current

# Continue draining the queue — schedule next tick
execute if data storage vortex:engine _mcmd_queue[0] run schedule function vortex:core/internal/api/cmd/other/multi_cmd/advanced/run_spread_tick 1t append

# Cleanup options when fully done
execute unless data storage vortex:engine _mcmd_queue[0] run data remove storage vortex:engine _mcmd_options
