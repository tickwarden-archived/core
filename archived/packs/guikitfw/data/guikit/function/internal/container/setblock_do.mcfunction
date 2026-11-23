# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
# macro $(x) $(y) $(z) $(ctype)
$execute if data storage guikit:work {ctype:"chest"} run setblock $(x) $(y) $(z) minecraft:chest
$execute if data storage guikit:work {ctype:"trapped_chest"} run setblock $(x) $(y) $(z) minecraft:trapped_chest
$execute if data storage guikit:work {ctype:"barrel"} run setblock $(x) $(y) $(z) minecraft:barrel
$execute if data storage guikit:work {ctype:"hopper"} run setblock $(x) $(y) $(z) minecraft:hopper
$execute if data storage guikit:work {ctype:"dropper"} run setblock $(x) $(y) $(z) minecraft:dropper
$execute if data storage guikit:work {ctype:"dispenser"} run setblock $(x) $(y) $(z) minecraft:dispenser
$execute if data storage guikit:work {ctype:"ender_chest"} run setblock $(x) $(y) $(z) minecraft:ender_chest
$execute if data storage guikit:work {ctype:"large_chest"} run setblock $(x) $(y) $(z) minecraft:chest
# clear contents
$data modify block $(x) $(y) $(z) Items set value []
