# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/events/uro_append [MACRO]
$data modify storage macroengine:engine events.$(event) append from storage macroengine:engine _uro.src[0]
