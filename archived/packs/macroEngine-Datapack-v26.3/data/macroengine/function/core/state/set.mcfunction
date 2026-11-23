# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/state/set [MACRO]
$data modify storage macroengine:engine states.$(player) set value "$(state)"
