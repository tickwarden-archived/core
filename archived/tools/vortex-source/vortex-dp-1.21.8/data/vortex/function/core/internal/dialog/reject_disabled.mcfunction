# vortex:core/internal/dialog/reject_disabled
data modify storage vortex:dialog_reject reason set value "disabled"
return run function vortex:core/internal/dialog/reject
