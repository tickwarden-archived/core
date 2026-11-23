# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/rearm
scoreboard players set @s vortex.dialog_click 0
scoreboard players enable @s vortex.dialog_click
scoreboard players set @s vortex.dialog_input 0
execute if entity @s[tag=vortex.dialog_form] run scoreboard players enable @s vortex.dialog_input
