# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# vortex:core/internal/api/cmd/other/multi_cmd/cond_missing_key
# A required condition key was absent. Macro expansion of the checker
# would fail silently and leave the verdict at its default (passed),
# so fail closed and say why.
# ─────────────────────────────────────────────────────────────────

scoreboard players set $mcmd_cond_result vortex.tmp 0

tellraw @a[tag=vortex.admin] ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"condition is missing a required key; treating it as not passed","color":"red"}]
