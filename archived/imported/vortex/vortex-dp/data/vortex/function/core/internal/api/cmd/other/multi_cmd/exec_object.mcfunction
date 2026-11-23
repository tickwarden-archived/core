# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/exec_object
# Evaluates the entry's condition, then dispatches.
#
# _mcmd_current shapes:
#   {cmd:"...", condition:{}, priority:0, pre_hook:"...", post_hook:"..."}
#   {func:"...", condition:{}}
#   {commands:[...], condition:{}}     nested group, expanded in place
#
# THE CHECK IS POSITIVE ON PURPOSE. An earlier revision read:
#
#     execute ... matches 0 run return run function .../exec_object_skipped
#
# That silently disabled every condition. exec_object_skipped's only line
# was conditioned on _mcmd_options.profile:1b, and all four entry points default
# profile to 0b, so the function ran no command at all; `return run` does
# not return from the caller when the command it wraps fails, so
# exec_object fell straight through to the execution lines. The condition
# was evaluated, its verdict was correct, and then it was ignored.
#
# The body now lives only on the branch where the verdict is known good,
# so no `return` semantics are involved anywhere in the decision.
# ─────────────────────────────────────────────────────────────────

execute if data storage vortex:engine _mcmd_current.condition run function vortex:core/internal/api/cmd/other/multi_cmd/check_condition

# No condition attached -> always run.
execute unless data storage vortex:engine _mcmd_current.condition run function vortex:core/internal/api/cmd/other/multi_cmd/exec_object_body

# Condition attached and passed -> run.
execute if data storage vortex:engine _mcmd_current.condition if score $mcmd_cond_result vortex.tmp matches 1 run function vortex:core/internal/api/cmd/other/multi_cmd/exec_object_body

# Condition attached and not passed -> skip. `unless ... matches 1` rather
# than `matches 0` so an unset or corrupt verdict also fails closed.
execute if data storage vortex:engine _mcmd_current.condition unless score $mcmd_cond_result vortex.tmp matches 1 run function vortex:core/internal/api/cmd/other/multi_cmd/exec_object_skipped
