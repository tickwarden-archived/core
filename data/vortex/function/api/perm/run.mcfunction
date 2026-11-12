# vortex:api/perm/run [MACRO]
execute if data storage vortex:engine modules{perm:0b} run return 0
scoreboard players set $pr_pid vortex.tmp 0
$execute store result score $pr_pid vortex.tmp run data get storage vortex:engine player_pids.$(player)
execute if score $pr_pid vortex.tmp matches 0 run return 0

data modify storage vortex:engine _pr_tmp set value {result:0b}
execute as @a if score @s vortex.pid = $pr_pid vortex.tmp run execute if entity @s[tag=vortex.admin] run data modify storage vortex:engine _pr_tmp.result set value 1b
$execute as @a if score @s vortex.pid = $pr_pid vortex.tmp run execute if entity @s[tag=perm.$(perm)] run data modify storage vortex:engine _pr_tmp.result set value 1b

# Read the verdict into a score and drop the scratch compound now, so no exit path below leaves it in storage.
execute store success score #pr_deny vortex.tmp if data storage vortex:engine _pr_tmp{result:0b}
data remove storage vortex:engine _pr_tmp

$execute if score #pr_deny vortex.tmp matches 1 run execute as @a if score @s vortex.pid = $pr_pid vortex.tmp run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" — you don't have this permission.","color":"red"}]
execute if score #pr_deny vortex.tmp matches 1 run return 0

# Dynamic commands are off by default (config dynamic_cmd). See docs/cmd_gate.md.
execute unless data storage vortex:engine config{dynamic_cmd:1b} run return 0
$execute as @a if score @s vortex.pid = $pr_pid vortex.tmp at @s run $(cmd)
