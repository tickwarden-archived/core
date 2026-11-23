# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/cond_any_of
# OR composition: at least one child in _mcmd_cond_eval.any_of must
# pass. Short-circuits on the first success.
# ─────────────────────────────────────────────────────────────────

function vortex:core/internal/api/cmd/other/multi_cmd/cond_depth_arg

execute if score $mcmd_cond_depth vortex.tmp matches 8.. run function vortex:core/internal/api/cmd/other/multi_cmd/cond_depth_error
execute if score $mcmd_cond_depth vortex.tmp matches ..7 run function vortex:core/internal/api/cmd/other/multi_cmd/cond_any_enter with storage vortex:engine _mcmd_depth_arg
