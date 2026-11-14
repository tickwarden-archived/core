# vortex:core/internal/dialog/authorize
execute if data storage vortex:dialog_event route{enabled:0b} run return run function vortex:core/internal/dialog/reject_disabled
execute if data storage vortex:dialog_event route{enabled:0} run return run function vortex:core/internal/dialog/reject_disabled
execute if score @s vortex.dialog_cool matches 1.. run return run function vortex:core/internal/dialog/reject_cooldown
scoreboard players set #allowed vortex.dialog_tmp 1
execute if data storage vortex:dialog_event route.guard run scoreboard players set #allowed vortex.dialog_tmp 0
execute if data storage vortex:dialog_event route.guard run function vortex:core/internal/dialog/guard with storage vortex:dialog_event route
execute unless score #allowed vortex.dialog_tmp matches 1 run return run function vortex:core/internal/dialog/reject_guard
return 1
