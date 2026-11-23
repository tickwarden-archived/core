# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# ======================================================================================
# macroengine:core/internal/ext/cooldown/arm [MACRO] [INTERNAL]
# Stores the new expiry (#ext_cd_new) for $(player)/$(key) and reports success.
# ======================================================================================

$execute store result storage macroengine:engine cooldowns.$(player).$(key) int 1 run scoreboard players get #ext_cd_new macroengine.tmp
data modify storage macroengine:output result set value 1b
return 1
