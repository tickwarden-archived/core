# vortex:core/internal/dialog/reject_ticket
data modify storage vortex:dialog_reject reason set value "ticket"
function vortex:core/internal/dialog/reject
return 0
