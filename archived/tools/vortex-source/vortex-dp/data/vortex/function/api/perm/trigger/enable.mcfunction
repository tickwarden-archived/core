# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/perm/trigger/enable [MACRO]
execute if data storage vortex:engine modules{perm:0b} run return 0
scoreboard players set $pte_pid vortex.tmp 0
$execute store result score $pte_pid vortex.tmp run data get storage vortex:engine player_pids.$(player)
execute if score $pte_pid vortex.tmp matches 0 run return 0

data modify storage vortex:engine _pte_tmp set value {result:0b}
execute as @a if score @s vortex.pid = $pte_pid vortex.tmp run execute if entity @s[tag=vortex.admin] run data modify storage vortex:engine _pte_tmp.result set value 1b
$execute if data storage vortex:engine permissions.$(player).$(perm) run data modify storage vortex:engine _pte_tmp.result set value 1b

$execute if data storage vortex:engine _pte_tmp{result:0b} run execute as @a if score @s vortex.pid = $pte_pid vortex.tmp run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" — you don't have this permission.","color":"red"}]
execute if data storage vortex:engine _pte_tmp{result:0b} run return 0

$execute as @a if score @s vortex.pid = $pte_pid vortex.tmp run scoreboard players enable @s $(name)

data remove storage vortex:engine _pte_tmp
