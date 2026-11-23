# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:core/internal/ext/world/count_near [MACRO] [INTERNAL]
# $(type) validated as namespace:path, $(r) is an int clamped to 1..1024.
# ======================================================================================

$execute store result storage vortex:output count int 1 if entity @e[type=$(type),distance=..$(r)]
