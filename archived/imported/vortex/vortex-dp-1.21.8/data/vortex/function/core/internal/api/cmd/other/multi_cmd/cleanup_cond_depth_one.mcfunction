# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/cleanup_cond_depth_one [MACRO]
# INPUT: $(d) — one nesting depth level
# ─────────────────────────────────────────────────────────────────

$data remove storage vortex:engine _mcmd_cond_save_$(d)
$data remove storage vortex:engine _mcmd_all_list_$(d)
$data remove storage vortex:engine _mcmd_any_list_$(d)
$scoreboard players reset $mcmd_all_pass_$(d) vortex.tmp
$scoreboard players reset $mcmd_any_pass_$(d) vortex.tmp
$scoreboard players reset $mcmd_not_inv_$(d) vortex.tmp
$scoreboard players reset $mcmd_not_depth_ok_$(d) vortex.tmp
