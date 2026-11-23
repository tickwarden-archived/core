# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# Force redraw for @s without reopening
execute unless score @s guikit.timer matches 1.. run return 0
scoreboard players set @s guikit.dirty 1
function guikit:internal/draw/redraw
