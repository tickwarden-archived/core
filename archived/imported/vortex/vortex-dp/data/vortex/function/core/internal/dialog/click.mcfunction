# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/click
function vortex:core/internal/dialog/context
execute store result storage vortex:dialog_ctx ticket int 1 run scoreboard players get @s vortex.dialog_click
scoreboard players reset @s vortex.dialog_click
data remove storage vortex:dialog_event route
function vortex:core/internal/dialog/find_route with storage vortex:dialog_ctx
execute unless data storage vortex:dialog_event route.callback run return run function vortex:core/internal/dialog/reject_ticket
execute store result score #authorized vortex.dialog_tmp run function vortex:core/internal/dialog/authorize
execute unless score #authorized vortex.dialog_tmp matches 1 run return 0
function vortex:core/internal/dialog/accept
data remove storage vortex:dialog_event value
data remove storage vortex:dialog_event reason
data modify storage vortex:dialog_event type set value "click"
# Consume before callback; callback may create a new session.
function vortex:core/internal/dialog/invalidate
dialog clear @s
function vortex:core/internal/dialog/event_context
function #vortex:hook/dialog_on_event
function vortex:core/internal/dialog/callback with storage vortex:dialog_event route
