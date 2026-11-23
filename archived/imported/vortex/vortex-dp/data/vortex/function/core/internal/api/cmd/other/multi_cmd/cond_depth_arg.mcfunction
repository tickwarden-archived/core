# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/cond_depth_arg
# Writes the current condition nesting depth into a macro argument
# compound so the recursive evaluators can build depth-indexed
# storage paths (a real stack, not a single shared slot).
#
# OUTPUT (storage vortex:engine _mcmd_depth_arg): {d:<int>}
# ─────────────────────────────────────────────────────────────────

execute store result storage vortex:engine _mcmd_depth_arg.d int 1 run scoreboard players get $mcmd_cond_depth vortex.tmp
