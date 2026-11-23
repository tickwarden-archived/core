# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:core/internal/api/perm/trigger/run_if_perm [MACRO]
execute if entity @s[tag=vortex.admin] run function vortex:core/internal/api/perm/trigger/exec with storage vortex:engine _ptd_current

$execute unless entity @s[tag=vortex.admin] if entity @s[tag=perm.$(perm)] run function vortex:core/internal/api/perm/trigger/exec with storage vortex:engine _ptd_current

$execute unless entity @s[tag=vortex.admin] unless entity @s[tag=perm.$(perm)] run tellraw @s ["",{"text":"[VORTEX] ","color":"#00AAAA","bold":true},{"text":"✘ ","color":"red"},{"text":"$(perm)","color":"yellow"},{"text":" — you don't have this permission.","color":"red"}]
