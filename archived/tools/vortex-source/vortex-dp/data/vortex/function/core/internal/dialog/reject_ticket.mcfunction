# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/reject_ticket
data modify storage vortex:dialog_reject reason set value "ticket"
function vortex:core/internal/dialog/reject
return 0
