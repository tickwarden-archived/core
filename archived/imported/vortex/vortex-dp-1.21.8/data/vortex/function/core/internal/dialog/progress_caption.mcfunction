# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/progress_caption [MACRO]
$data modify storage vortex:dialog_progress component.extra append value {text:"] $(percent)% • $(value)/$(max)",color:"gray"}
