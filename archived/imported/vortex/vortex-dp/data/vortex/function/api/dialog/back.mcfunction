# vortex:api/dialog/back
function vortex:core/internal/dialog/context
data remove storage vortex:dialog_nav target
function vortex:core/internal/dialog/pop with storage vortex:dialog_ctx
execute unless data storage vortex:dialog_nav target.callback run return run function vortex:api/dialog/close
function vortex:core/internal/dialog/callback with storage vortex:dialog_nav target
