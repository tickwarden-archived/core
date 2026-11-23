# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/cond_check_score
# Score leaf.
#   condition.score = {objective:"level", min:5}
#
# Optional keys and their defaults:
#   target  "@s"            any entity selector the scoreboard command accepts
#   min     -2147483648     lower bound, inclusive
#   max      2147483647     upper bound, inclusive
#
# `objective` is required; without it the condition fails closed.
# A target that has no score on the objective also fails closed rather
# than being read as 0.
# ─────────────────────────────────────────────────────────────────

data modify storage vortex:engine _mcmd_cond_tmp set from storage vortex:engine _mcmd_cond_eval.score

execute unless data storage vortex:engine _mcmd_cond_tmp.target run data modify storage vortex:engine _mcmd_cond_tmp.target set value "@s"
execute unless data storage vortex:engine _mcmd_cond_tmp.min run data modify storage vortex:engine _mcmd_cond_tmp.min set value -2147483648
execute unless data storage vortex:engine _mcmd_cond_tmp.max run data modify storage vortex:engine _mcmd_cond_tmp.max set value 2147483647

execute unless data storage vortex:engine _mcmd_cond_tmp.objective run function vortex:core/internal/api/cmd/other/multi_cmd/cond_missing_key
execute if data storage vortex:engine _mcmd_cond_tmp.objective run function vortex:core/internal/api/cmd/other/multi_cmd/cond_score_exec with storage vortex:engine _mcmd_cond_tmp

data remove storage vortex:engine _mcmd_cond_tmp
