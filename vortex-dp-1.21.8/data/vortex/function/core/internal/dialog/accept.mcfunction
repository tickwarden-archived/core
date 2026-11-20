# vortex:core/internal/dialog/accept
execute store result score @s vortex.dialog_cool run data get storage vortex:dialog_config cooldown
execute if score @s vortex.dialog_cool matches ..-1 run scoreboard players set @s vortex.dialog_cool 0
execute if score @s vortex.dialog_cool matches 1201.. run scoreboard players set @s vortex.dialog_cool 1200
scoreboard players add @s vortex.dialog_accept 1
scoreboard players add #accepted vortex.dialog_stat 1
