# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(key)
$execute if score @s $(key) = #val guikit.tmp if data storage guikit:draw w.radio.on_item run data modify storage guikit:draw w.item set from storage guikit:draw w.radio.on_item
$execute if score @s $(key) = #val guikit.tmp unless data storage guikit:draw w.radio.on_item run data modify storage guikit:draw w.item set value "minecraft:lime_dye"
