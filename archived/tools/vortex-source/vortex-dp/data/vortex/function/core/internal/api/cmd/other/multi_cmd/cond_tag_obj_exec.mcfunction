# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/cmd/other/multi_cmd/cond_tag_obj_exec [MACRO]
# INPUT: $(name), $(has)

$execute if data storage vortex:engine _mcmd_cond_tmp{has:1b} unless entity @s[tag=$(name)] run scoreboard players set $mcmd_cond_result vortex.tmp 0
$execute if data storage vortex:engine _mcmd_cond_tmp{has:0b} if entity @s[tag=$(name)] run scoreboard players set $mcmd_cond_result vortex.tmp 0
