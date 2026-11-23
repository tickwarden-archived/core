# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/cond_all_enter [MACRO]
# INPUT: $(d) — nesting depth, used to build depth-indexed storage keys
# ─────────────────────────────────────────────────────────────────

# Preserve the parent condition object: evaluating a child overwrites
# _mcmd_cond_eval, and cond_eval_core still reads sibling composition
# keys (any_of / not) from it after this call returns.
$data modify storage vortex:engine _mcmd_cond_save_$(d) set from storage vortex:engine _mcmd_cond_eval
$data modify storage vortex:engine _mcmd_all_list_$(d) set from storage vortex:engine _mcmd_cond_eval.all_of

scoreboard players add $mcmd_cond_depth vortex.tmp 1
$scoreboard players set $mcmd_all_pass_$(d) vortex.tmp 1

function vortex:core/internal/api/cmd/other/multi_cmd/cond_all_loop with storage vortex:engine _mcmd_depth_arg

scoreboard players remove $mcmd_cond_depth vortex.tmp 1

$execute if score $mcmd_all_pass_$(d) vortex.tmp matches 0 run scoreboard players set $mcmd_cond_result vortex.tmp 0

$data modify storage vortex:engine _mcmd_cond_eval set from storage vortex:engine _mcmd_cond_save_$(d)
$data remove storage vortex:engine _mcmd_cond_save_$(d)
$data remove storage vortex:engine _mcmd_all_list_$(d)
$scoreboard players reset $mcmd_all_pass_$(d) vortex.tmp
