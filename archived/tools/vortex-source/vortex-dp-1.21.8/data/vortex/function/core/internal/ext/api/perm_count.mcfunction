# ======================================================================================
# vortex:core/internal/ext/api/perm_count [MACRO] [INTERNAL]
# $(player) has already been validated by api/perm/count.
# ======================================================================================

$execute if data storage vortex:engine permissions.$(player) store result storage vortex:output result int 1 run data get storage vortex:engine permissions.$(player)
