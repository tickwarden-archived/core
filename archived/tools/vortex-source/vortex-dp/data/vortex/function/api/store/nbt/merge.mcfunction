# vortex:api/store/nbt/merge [MACRO]
# Merges the compound in vortex:store nbt.value into storage/path. Input (macro args): storage, path
execute if data storage vortex:engine modules{store:0b} run return 0
$data modify storage $(storage) $(path) merge from storage vortex:store nbt.value
