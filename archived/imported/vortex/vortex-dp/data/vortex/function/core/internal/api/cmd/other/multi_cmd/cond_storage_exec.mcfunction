# vortex:core/internal/api/cmd/other/multi_cmd/cond_storage_exec [MACRO]
# INPUT: $(storage)

$execute unless data storage $(storage) run scoreboard players set $mcmd_cond_result vortex.tmp 0
