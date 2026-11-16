# vortex:core/internal/core/lib/batch/begin_exec [MACRO]
# INPUT: $(id), $(spread_over)

$data modify storage vortex:engine batches.$(id) set value {items:[],spread_over:$(spread_over),flushed:0b}
