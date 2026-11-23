# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/template_routes
execute unless data storage vortex:dialog_template queue[0] run return 0
data modify storage vortex:dialog_work route set from storage vortex:dialog_template queue[0]
data modify storage vortex:dialog_template patch.old set from storage vortex:dialog_work route.ticket
execute store result score #ok vortex.dialog_tmp run function vortex:core/internal/dialog/ticket
execute unless score #ok vortex.dialog_tmp matches 1 run return run function vortex:core/internal/dialog/template_failed
data modify storage vortex:dialog_template patch.new set from storage vortex:dialog_work route.ticket
function vortex:core/internal/dialog/template_patch with storage vortex:dialog_template patch
data modify storage vortex:dialog_work routes append from storage vortex:dialog_work route
data remove storage vortex:dialog_template queue[0]
function vortex:core/internal/dialog/template_routes
