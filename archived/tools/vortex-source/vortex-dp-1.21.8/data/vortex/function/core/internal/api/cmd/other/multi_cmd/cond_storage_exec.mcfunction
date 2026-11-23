# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/cmd/other/multi_cmd/cond_storage_exec [MACRO]
# INPUT: $(storage)

$execute unless data storage $(storage) run scoreboard players set $mcmd_cond_result vortex.tmp 0
