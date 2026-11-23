# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/reject_validation
data modify storage vortex:dialog_reject reason set value "validation"
function vortex:core/internal/dialog/reject
return 0
