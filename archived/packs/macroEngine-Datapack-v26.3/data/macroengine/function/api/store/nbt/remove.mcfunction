# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_cc1cb841d8:lifecycle {phase:1} run return 0
# macroengine:api/store/nbt/remove [MACRO]
# Removes storage/path. Input (macro args): storage, path
execute if data storage macroengine:engine modules{store:0b} run return 0
$data remove storage $(storage) $(path)
