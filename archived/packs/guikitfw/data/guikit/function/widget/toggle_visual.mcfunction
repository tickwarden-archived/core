# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(key)
$execute unless score @s $(key) matches 1 run data modify storage guikit:draw w.item set from storage guikit:draw w.off
