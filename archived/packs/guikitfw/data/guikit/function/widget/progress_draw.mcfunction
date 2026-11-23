# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(key) — compute filled cells from score/max * width
$execute store result score #cur guikit.tmp run scoreboard players get @s $(key)
scoreboard players set #i guikit.tmp 0
function guikit:widget/progress_cell
