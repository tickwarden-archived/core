# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/perm/revoke [MACRO]
execute if data storage vortex:engine modules{perm:0b} run return 0
execute if entity @s unless entity @s[tag=vortex.admin] run playsound vortex:perm.denied master @s ~ ~ ~ 1 1
execute if entity @s unless entity @s[tag=vortex.admin] run return run tellraw @s ["",{"text":"\uE000","color":"#00AAAA"},{"text":" ","color":"#00AAAA"},{"text":"✘ ","color":"red"},{"translate":"vortex.msg.permission_denied","color":"red"}]

$data remove storage vortex:engine permissions.$(player).$(perm)

scoreboard players set $prv_pid vortex.tmp 0
$execute store result score $prv_pid vortex.tmp run data get storage vortex:engine player_pids.$(player)
$execute as @a if score @s vortex.pid = $prv_pid vortex.tmp run tag @s remove perm.$(perm)
$advancement revoke @a[name=$(player),limit=1] only vortex:api/perm/$(perm)
