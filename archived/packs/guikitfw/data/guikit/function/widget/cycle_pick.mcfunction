# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(key)
$execute store result storage guikit:work idx int 1 run scoreboard players get @s $(key)
data modify storage guikit:work opts set from storage guikit:draw w.cycle.options
function guikit:widget/cycle_apply
