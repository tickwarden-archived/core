# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/filter_match [MACRO]
execute if data storage vortex:dialog_filter options{query:""} run return run data modify storage vortex:dialog_filter model.items append from storage vortex:dialog_filter queue[0]
$execute if data storage vortex:dialog_filter item{tags:["$(query)"]} run data modify storage vortex:dialog_filter model.items append from storage vortex:dialog_filter queue[0]
