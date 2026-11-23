# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/cond_all_of
# AND composition: every child in _mcmd_cond_eval.all_of must pass.
# Short-circuits on the first failure.
# ─────────────────────────────────────────────────────────────────

function vortex:core/internal/api/cmd/other/multi_cmd/cond_depth_arg

execute if score $mcmd_cond_depth vortex.tmp matches 8.. run function vortex:core/internal/api/cmd/other/multi_cmd/cond_depth_error
execute if score $mcmd_cond_depth vortex.tmp matches ..7 run function vortex:core/internal/api/cmd/other/multi_cmd/cond_all_enter with storage vortex:engine _mcmd_depth_arg
