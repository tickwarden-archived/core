# vortex:core/internal/dialog/expired
scoreboard players add @s vortex.dialog_expire 1
scoreboard players add #expired vortex.dialog_stat 1
function vortex:core/internal/dialog/lifecycle
data modify storage vortex:dialog_event type set value "timeout"
function #vortex:hook/dialog_on_timeout
function vortex:api/dialog/close
