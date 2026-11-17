# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/cond_not_enter [MACRO]
# INPUT: $(d) — nesting depth
#
# A depth overflow inside `not` fails closed (the child reports 0), which
# would invert to "passed". Restore an explicit not-passed verdict in that
# case so an over-deep tree can never pass.
# ─────────────────────────────────────────────────────────────────

$data modify storage vortex:engine _mcmd_cond_save_$(d) set from storage vortex:engine _mcmd_cond_eval

scoreboard players add $mcmd_cond_depth vortex.tmp 1
$scoreboard players set $mcmd_not_depth_ok_$(d) vortex.tmp 1
$execute if score $mcmd_cond_depth vortex.tmp matches 9.. run scoreboard players set $mcmd_not_depth_ok_$(d) vortex.tmp 0

$data modify storage vortex:engine _mcmd_cond_eval set from storage vortex:engine _mcmd_cond_save_$(d).not
function vortex:core/internal/api/cmd/other/multi_cmd/cond_eval_core
scoreboard players remove $mcmd_cond_depth vortex.tmp 1

# Invert, unless the child bailed out on depth.
$execute if score $mcmd_not_depth_ok_$(d) vortex.tmp matches 1 if score $mcmd_cond_result vortex.tmp matches 1 run scoreboard players set $mcmd_not_inv_$(d) vortex.tmp 0
$execute if score $mcmd_not_depth_ok_$(d) vortex.tmp matches 1 if score $mcmd_cond_result vortex.tmp matches 0 run scoreboard players set $mcmd_not_inv_$(d) vortex.tmp 1
$execute if score $mcmd_not_depth_ok_$(d) vortex.tmp matches 0 run scoreboard players set $mcmd_not_inv_$(d) vortex.tmp 0
$execute if score $mcmd_not_depth_ok_$(d) vortex.tmp matches 0 run function vortex:core/internal/api/cmd/other/multi_cmd/cond_depth_error
$scoreboard players operation $mcmd_cond_result vortex.tmp = $mcmd_not_inv_$(d) vortex.tmp

$data modify storage vortex:engine _mcmd_cond_eval set from storage vortex:engine _mcmd_cond_save_$(d)
$data remove storage vortex:engine _mcmd_cond_save_$(d)
$scoreboard players reset $mcmd_not_inv_$(d) vortex.tmp
$scoreboard players reset $mcmd_not_depth_ok_$(d) vortex.tmp
