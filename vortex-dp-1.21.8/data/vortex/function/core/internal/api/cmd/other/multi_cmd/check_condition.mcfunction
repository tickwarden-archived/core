# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/check_condition
# Public entry point. Evaluates the condition attached to the command
# currently being executed and writes the verdict to
# $mcmd_cond_result vortex.tmp (1 = passed, 0 = not passed).
#
# INPUT (storage vortex:engine _mcmd_current.condition)
#
# The full supported schema is documented in cond_eval_core.mcfunction.
# ─────────────────────────────────────────────────────────────────

# Depth 0 for a top-level evaluation.
scoreboard players set $mcmd_cond_depth vortex.tmp 0

data modify storage vortex:engine _mcmd_cond_eval set from storage vortex:engine _mcmd_current.condition
function vortex:core/internal/api/cmd/other/multi_cmd/cond_eval_core

data remove storage vortex:engine _mcmd_cond_eval
