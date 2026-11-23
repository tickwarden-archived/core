# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:core/internal/ext/api/perm_count [MACRO] [INTERNAL]
# $(player) has already been validated by api/perm/count.
# ======================================================================================

$execute if data storage vortex:engine permissions.$(player) store result storage vortex:output result int 1 run data get storage vortex:engine permissions.$(player)
