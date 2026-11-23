# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# ======================================================================================
# vortex:core/internal/ext/cooldown/arm [MACRO] [INTERNAL]
# Stores the new expiry (#ext_cd_new) for $(player)/$(key) and reports success.
# ======================================================================================

$execute store result storage vortex:engine cooldowns.$(player).$(key) int 1 run scoreboard players get #ext_cd_new vortex.tmp
data modify storage vortex:output result set value 1b
return 1
