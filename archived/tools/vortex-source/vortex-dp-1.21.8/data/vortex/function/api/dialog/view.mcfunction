# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/dialog/view [MACRO]
$data modify storage vortex:dialog_work view set value {callback:$(callback),payload:$(payload)}
