# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# Macro: receives {x, y, z}
$data modify block $(x) $(y) $(z) auto set value 0b
$setblock $(x) $(y) $(z) minecraft:air replace
$forceload remove $(x) $(z)
