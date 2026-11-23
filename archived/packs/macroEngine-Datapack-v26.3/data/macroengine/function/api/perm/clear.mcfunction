# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/perm/clear [MACRO]
execute if data storage macroengine:engine modules{perm:0b} run return 0
execute if entity @s unless entity @s[tag=macroengine.admin] run return run tellraw @s ["",{"text":"[MACROENGINE] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"Permission denied.","color":"red"}]

$data remove storage macroengine:engine permissions.$(player)
$advancement revoke @a[name=$(player),limit=1] from macroengine:hidden/root
