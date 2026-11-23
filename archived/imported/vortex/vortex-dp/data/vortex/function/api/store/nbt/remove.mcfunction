# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_8ca60b8329:lifecycle {phase:1} run return 0
# vortex:api/store/nbt/remove [MACRO]
# Removes storage/path. Input (macro args): storage, path
execute if data storage vortex:engine modules{store:0b} run return 0
$data remove storage $(storage) $(path)
