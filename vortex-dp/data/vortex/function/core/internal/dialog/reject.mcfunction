# vortex:core/internal/dialog/reject
scoreboard players add @s vortex.dialog_reject 1
scoreboard players add #rejected vortex.dialog_stat 1
function vortex:core/internal/dialog/lifecycle
data modify storage vortex:dialog_event type set value "reject"
data modify storage vortex:dialog_event reason set from storage vortex:dialog_reject reason
function #vortex:hook/dialog_on_reject
# Restore the committed screen without extending TTL or issuing a new ticket.
function vortex:core/internal/dialog/context
function vortex:core/internal/dialog/resume with storage vortex:dialog_ctx
function vortex:core/internal/dialog/rearm
