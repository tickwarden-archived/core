# vortex:core/internal/api/cmd/other/multi_cmd/cond_entity_exec [MACRO]
# INPUT: $(entity)

$execute unless entity $(entity) run scoreboard players set $mcmd_cond_result vortex.tmp 0
