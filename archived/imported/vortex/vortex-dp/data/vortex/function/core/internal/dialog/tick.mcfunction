# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/dialog/tick
execute as @a unless score @s vortex.dialog_id matches 1.. run function vortex:core/internal/dialog/identify
execute as @a unless score @s vortex.dialog_epoch = #epoch vortex.dialog_sys run function vortex:core/internal/dialog/rejoin
execute as @a unless score @s vortex.dialog_seen = @s vortex.dialog_leave run function vortex:core/internal/dialog/rejoin
execute as @a[scores={vortex.dialog_cool=1..}] run scoreboard players remove @s vortex.dialog_cool 1
execute as @a[tag=vortex.dialog_active] run scoreboard players remove @s vortex.dialog_ttl 1
execute as @a[tag=vortex.dialog_active,scores={vortex.dialog_interval=5..,vortex.dialog_refresh=1..}] run scoreboard players remove @s vortex.dialog_refresh 1
execute as @a[tag=vortex.dialog_active,scores={vortex.dialog_ttl=..0}] run function vortex:core/internal/dialog/expired
execute as @a[tag=vortex.dialog_active,scores={vortex.dialog_click=1..}] at @s run function vortex:core/internal/dialog/click
execute as @a[tag=vortex.dialog_active,tag=vortex.dialog_form,scores={vortex.dialog_input=1..}] at @s run function vortex:core/internal/dialog/input
execute as @a[tag=vortex.dialog_active,scores={vortex.dialog_interval=5..,vortex.dialog_refresh=..0}] at @s run function vortex:core/internal/dialog/auto_refresh
execute as @a at @s run function vortex:core/internal/dialog/delay_tick
