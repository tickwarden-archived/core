# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# Permission system off (module_perm 0b or perm_enforce 0b): everybody passes.
execute if data storage vortex:engine modules{perm:0b} run return 1
execute if score #perm_enforce vortex.tick_flags matches 0 run return 1
scoreboard players set $pc_pid vortex.tmp 0
$execute store result score $pc_pid vortex.tmp run data get storage vortex:engine player_pids.$(player)
execute if score $pc_pid vortex.tmp matches 0 run return 0

execute as @a if score @s vortex.pid = $pc_pid vortex.tmp run execute if entity @s[tag=vortex.admin] run return 1

$execute as @a if score @s vortex.pid = $pc_pid vortex.tmp run execute if entity @s[tag=perm.$(perm)] run return 1

execute as @a if score @s vortex.pid = $pc_pid vortex.tmp run playsound vortex:perm.denied master @s ~ ~ ~ 1 1
$execute as @a if score @s vortex.pid = $pc_pid vortex.tmp run tellraw @s ["",{"text":"\uE000","color":"#00AAAA"},{"text":" ","color":"#00AAAA"},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" ","color":"red"},{"translate":"vortex.msg.no_perm","with":[""],"color":"red"}]
return 0
