# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/ticket
# Never recycle tickets. Stop safely before the signed packed-input limit.
execute if score #ticket vortex.dialog_sys matches 200000000.. run return 0
scoreboard players add #ticket vortex.dialog_sys 1
execute store result storage vortex:dialog_work route.ticket int 1 run scoreboard players get #ticket vortex.dialog_sys
return 1
