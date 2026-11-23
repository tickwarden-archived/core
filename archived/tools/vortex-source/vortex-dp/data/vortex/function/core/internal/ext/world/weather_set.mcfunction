# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:core/internal/ext/world/weather_set [MACRO] [INTERNAL]
# $(weather) is one of clear|rain|thunder (checked by world/weather/set),
# $(d) is an int clamped to 1..1000000.
# ======================================================================================

$weather $(weather) $(d)
data modify storage vortex:output ok set value 1b
