# vortex:core/internal/dialog/reject_guard
data modify storage vortex:dialog_reject reason set value "guard"
function vortex:core/internal/dialog/reject
return 0
