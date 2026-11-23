# vortex:core/internal/dialog/rearm
scoreboard players set @s vortex.dialog_click 0
scoreboard players enable @s vortex.dialog_click
scoreboard players set @s vortex.dialog_input 0
execute if entity @s[tag=vortex.dialog_form] run scoreboard players enable @s vortex.dialog_input
