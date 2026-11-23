# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/cmd/other/multi_cmd/cond_score_exec [MACRO]
# INPUT: $(objective), $(min), $(max), $(target)
#
# `store success` distinguishes "score is 0" from "no score at all":
# without it a missing score would read as 0 and silently satisfy a
# min:..0 range.

$execute store success score $mcmd_cond_ok vortex.tmp if score $(target) $(objective) matches -2147483648..2147483647
execute if score $mcmd_cond_ok vortex.tmp matches 0 run scoreboard players set $mcmd_cond_result vortex.tmp 0
$execute if score $mcmd_cond_ok vortex.tmp matches 1 store result score $mcmd_cond_score vortex.tmp run scoreboard players get $(target) $(objective)
$execute if score $mcmd_cond_ok vortex.tmp matches 1 if score $mcmd_cond_score vortex.tmp matches $(min)..$(max) run scoreboard players set $mcmd_cond_result vortex.tmp 1
$execute if score $mcmd_cond_ok vortex.tmp matches 1 unless score $mcmd_cond_score vortex.tmp matches $(min)..$(max) run scoreboard players set $mcmd_cond_result vortex.tmp 0
