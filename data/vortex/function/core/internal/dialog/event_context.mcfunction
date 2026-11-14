# vortex:core/internal/dialog/event_context
data modify storage vortex:dialog_event player set from entity @s UUID
execute store result storage vortex:dialog_event player_id int 1 run scoreboard players get @s vortex.dialog_id
