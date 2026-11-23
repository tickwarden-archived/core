# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/systems/string/repeat_11 [MACRO]
$data modify storage vortex:output result set value "$(char)$(char)$(char)$(char)$(char)$(char)$(char)$(char)$(char)$(char)$(char)"
