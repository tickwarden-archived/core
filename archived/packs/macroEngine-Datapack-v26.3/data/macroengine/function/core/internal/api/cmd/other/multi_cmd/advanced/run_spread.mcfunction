# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:api/cmd/other/multi_cmd/advanced/internal/run_spread
# Spreads _mcmd_queue execution: one item per tick.
# Schedules run_spread_tick which self-reschedules until queue is drained.
# Supports full item format (conditions, hooks, cmd, func).
# ─────────────────────────────────────────────────────────────────

execute if data storage macroengine:engine _mcmd_queue[0] run schedule function macroengine:core/internal/api/cmd/other/multi_cmd/advanced/run_spread_tick 1t append
