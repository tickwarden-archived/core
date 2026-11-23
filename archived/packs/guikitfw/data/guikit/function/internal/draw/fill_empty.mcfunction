# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# Fill unoccupied slots with menu.default_filler or gray pane (guigen fill_empty)
execute unless data storage guikit:draw menu{fill_empty:1b} unless data storage guikit:draw menu.fill_empty run return 0
data modify storage guikit:work filler set from storage guikit:draw menu.default_filler
execute unless data storage guikit:work filler run data modify storage guikit:work filler set value "minecraft:gray_stained_glass_pane"
# Chest minecart: 27 slots
scoreboard players set #slot guikit.tmp 0
function guikit:internal/draw/fill_empty_loop
