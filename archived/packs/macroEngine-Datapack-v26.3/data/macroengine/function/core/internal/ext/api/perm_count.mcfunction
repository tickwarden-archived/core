# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ======================================================================================
# macroengine:core/internal/ext/api/perm_count [MACRO] [INTERNAL]
# $(player) has already been validated by api/perm/count.
# ======================================================================================

$execute if data storage macroengine:engine permissions.$(player) store result storage macroengine:output result int 1 run data get storage macroengine:engine permissions.$(player)
