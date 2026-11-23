# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ─────────────────────────────────────────────────────────────────
# macroengine:core/internal/api/cmd/other/multi_cmd/cond_depth_error
# Condition nesting deeper than MAX_DEPTH. Fails closed: the condition
# reports 0 (not passed) so an over-deep tree can never silently pass.
# ─────────────────────────────────────────────────────────────────

scoreboard players set $mcmd_cond_result macroengine.tmp 0

tellraw @a[tag=macroengine.admin] ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"condition nesting exceeds the depth limit; treating it as not passed","color":"red"}]
