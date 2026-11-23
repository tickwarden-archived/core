# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:core/internal/api/container/_count [INTERNAL, MACRO: x, y, z]
# Stores the number of occupied slots (length of Items) in #ct_n. RETURN 1 if readable, else 0.
scoreboard players set #ct_n vortex.tmp 0
$execute unless data block $(x) $(y) $(z) Items run return 0
$execute store result score #ct_n vortex.tmp run data get block $(x) $(y) $(z) Items
return 1
