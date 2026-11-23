# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/lib/batch/internal/begin_exec [MACRO]
# INPUT: $(id), $(spread_over)

$data modify storage macroengine:engine batches.$(id) set value {items:[],spread_over:$(spread_over),flushed:0b}
