# vortex:core/internal/dialog/rejoin
scoreboard players add @s vortex.dialog_leave 0
scoreboard players operation @s vortex.dialog_seen = @s vortex.dialog_leave
function vortex:core/internal/dialog/invalidate
scoreboard players operation @s vortex.dialog_epoch = #epoch vortex.dialog_sys
scoreboard players add @s vortex.dialog_cool 0
scoreboard players add @s vortex.dialog_shown 0
scoreboard players add @s vortex.dialog_accept 0
scoreboard players add @s vortex.dialog_reject 0
scoreboard players add @s vortex.dialog_expire 0
