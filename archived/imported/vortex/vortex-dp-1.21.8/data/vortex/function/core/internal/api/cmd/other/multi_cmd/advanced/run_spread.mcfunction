# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:api/cmd/other/multi_cmd/advanced/internal/run_spread
# Spreads _mcmd_queue execution: one item per tick.
# Schedules run_spread_tick which self-reschedules until queue is drained.
# Supports full item format (conditions, hooks, cmd, func).
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine _mcmd_queue[0] run schedule function vortex:core/internal/api/cmd/other/multi_cmd/advanced/run_spread_tick 1t append
