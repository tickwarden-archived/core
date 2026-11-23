# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/reject_disabled
data modify storage vortex:dialog_reject reason set value "disabled"
return run function vortex:core/internal/dialog/reject
