# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:core/internal/api/container/_count [INTERNAL, MACRO: x, y, z]
# Stores the number of occupied slots (length of Items) in #ct_n. RETURN 1 if readable, else 0.
scoreboard players set #ct_n macroengine.tmp 0
$execute unless data block $(x) $(y) $(z) Items run return 0
$execute store result score #ct_n macroengine.tmp run data get block $(x) $(y) $(z) Items
return 1
