# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_c8645e117f:lifecycle {phase:1} run return 0
scoreboard players set #far guikit.tmp 0
function guikit:internal/container/load_pos
function guikit:internal/container/block_distance_do with storage guikit:work
