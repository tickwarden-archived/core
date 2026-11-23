# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/systems/string/repeat_16 [MACRO]
$data modify storage macroengine:output result set value "$(char)$(char)$(char)$(char)$(char)$(char)$(char)$(char)$(char)$(char)$(char)$(char)$(char)$(char)$(char)$(char)"
