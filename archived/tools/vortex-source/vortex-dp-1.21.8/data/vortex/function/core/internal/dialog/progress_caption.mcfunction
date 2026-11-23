# vortex:core/internal/dialog/progress_caption [MACRO]
$data modify storage vortex:dialog_progress component.extra append value {text:"] $(percent)% • $(value)/$(max)",color:"gray"}
