# EOL entry guard; see vortaforge-eol.json
execute unless data storage vf_eol_63b504a29e:lifecycle {phase:1} run return 0
# vortex:api/store/nbt/merge [MACRO]
# Merges the compound in vortex:store nbt.value into storage/path. Input (macro args): storage, path
execute if data storage vortex:engine modules{store:0b} run return 0
$data modify storage $(storage) $(path) merge from storage vortex:store nbt.value
