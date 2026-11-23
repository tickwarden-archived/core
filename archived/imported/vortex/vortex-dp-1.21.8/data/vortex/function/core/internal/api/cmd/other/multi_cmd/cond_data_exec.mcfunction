# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/cmd/other/multi_cmd/cond_data_exec [MACRO]
# INPUT: $(storage), $(path), $(min), $(max), $(scale)

$execute store success score $mcmd_cond_ok vortex.tmp if data storage $(storage) $(path)
execute if score $mcmd_cond_ok vortex.tmp matches 0 run scoreboard players set $mcmd_cond_result vortex.tmp 0
$execute if score $mcmd_cond_ok vortex.tmp matches 1 store result score $mcmd_cond_score vortex.tmp run data get storage $(storage) $(path) scale $(scale)
$execute if score $mcmd_cond_ok vortex.tmp matches 1 if score $mcmd_cond_score vortex.tmp matches $(min)..$(max) run scoreboard players set $mcmd_cond_result vortex.tmp 1
$execute if score $mcmd_cond_ok vortex.tmp matches 1 unless score $mcmd_cond_score vortex.tmp matches $(min)..$(max) run scoreboard players set $mcmd_cond_result vortex.tmp 0
