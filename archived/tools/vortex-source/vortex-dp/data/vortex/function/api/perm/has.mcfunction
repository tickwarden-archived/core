# vortex:api/perm/has [MACRO]
execute if data storage vortex:engine modules{perm:0b} run return 0
data modify storage vortex:output result set value 0b

scoreboard players set $ph_pid vortex.tmp 0
$execute store result score $ph_pid vortex.tmp run data get storage vortex:engine player_pids.$(player)

execute as @a if score @s vortex.pid = $ph_pid vortex.tmp run execute if entity @s[tag=vortex.admin] run data modify storage vortex:output result set value 1b
$execute as @a if score @s vortex.pid = $ph_pid vortex.tmp run execute if entity @s[tag=perm.$(perm)] run data modify storage vortex:output result set value 1b

$execute if data storage vortex:engine permissions.$(player).$(perm) run data modify storage vortex:output result set value 1b
