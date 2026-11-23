# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/cond_check_tag
# Tag leaf. Two accepted shapes:
#   condition.tag = "admin"                  shorthand for {name:"admin",has:1b}
#   condition.tag = {name:"admin",has:1b|0b} has:0b asserts the tag is ABSENT
# ─────────────────────────────────────────────────────────────────

execute unless data storage vortex:engine _mcmd_cond_eval.tag{} run function vortex:core/internal/api/cmd/other/multi_cmd/cond_tag_simple
execute if data storage vortex:engine _mcmd_cond_eval.tag{} run function vortex:core/internal/api/cmd/other/multi_cmd/cond_tag_object
