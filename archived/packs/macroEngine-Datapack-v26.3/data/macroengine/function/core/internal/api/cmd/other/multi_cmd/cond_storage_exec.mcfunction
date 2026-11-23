# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/cmd/other/multi_cmd/cond_storage_exec [MACRO]
# INPUT: $(storage)

$execute unless data storage $(storage) run scoreboard players set $mcmd_cond_result macroengine.tmp 0
