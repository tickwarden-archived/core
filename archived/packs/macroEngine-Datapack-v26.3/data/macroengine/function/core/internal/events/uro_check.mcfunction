# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/events/uro_check [MACRO]
$execute unless data storage macroengine:engine _uro{func:"$(func)"} run function macroengine:core/internal/events/uro_append with storage macroengine:engine _uro
