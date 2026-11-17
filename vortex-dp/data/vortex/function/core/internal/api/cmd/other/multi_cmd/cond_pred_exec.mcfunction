# vortex:core/internal/api/cmd/other/multi_cmd/cond_pred_exec [MACRO]
# INPUT: $(predicate)

$execute unless predicate $(predicate) run scoreboard players set $mcmd_cond_result vortex.tmp 0
