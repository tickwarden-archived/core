# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/event_context
data modify storage vortex:dialog_event player set from entity @s UUID
execute store result storage vortex:dialog_event player_id int 1 run scoreboard players get @s vortex.dialog_id
