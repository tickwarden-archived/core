# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/core/lib/batch/begin_exec [MACRO]
# INPUT: $(id), $(spread_over)

$data modify storage vortex:engine batches.$(id) set value {items:[],spread_over:$(spread_over),flushed:0b}
