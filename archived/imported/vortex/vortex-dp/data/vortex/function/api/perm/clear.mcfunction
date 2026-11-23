# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/perm/clear [MACRO]
execute if data storage vortex:engine modules{perm:0b} run return 0
execute if entity @s unless entity @s[tag=vortex.admin] run return run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

$data remove storage vortex:engine permissions.$(player)
$advancement revoke @a[name=$(player),limit=1] from vortex:hidden/root
